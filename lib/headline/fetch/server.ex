# TODO: Possibly use a `Task.Supervisor` to restart individual fetch jobs.
# TODO: Start a new "run" when `tasks` is empty, and group stats by run
defmodule Headline.Fetch.Server do
  import SweetXml
  alias Headline.RSS
  require Logger

  use GenServer

  # Client: API
  def start_run do
    Process.send(Fetcher, :fetch, [])
  end

  def start_link(default) do
    GenServer.start_link(__MODULE__, default, name: Fetcher)
  end

  def stats do
    GenServer.call(Fetcher, :stats)
  end

  # Server: callbacks
  @impl true
  def init(state) do
    Process.flag(:trap_exit, true)
    delay = Map.get(state, :delay, 3600000)
    {:ok, Map.merge(state, %{success: [], fail: [], delay: delay}), {:continue, :fetch}}
  end

  @impl true
  def handle_continue(:fetch, state) do
    :ok = Process.send(self(), :fetch, [])
    {:noreply, state}
  end

  @impl true
  def handle_info(:fetch, state = %{delay: delay}) do
    # TODO: Terminate existing jobs
    tasks = run()
    Process.send_after(self(), :fetch, delay)
    {:noreply, Map.put(state, :tasks, tasks)}
  end

  @impl true
  def handle_info({:EXIT, pid, :normal}, state = %{success: success, tasks: tasks}) do
    title = Map.fetch!(tasks, pid)
    {:noreply, %{state | success: [{DateTime.utc_now(), title} | success], tasks: Map.delete(tasks, pid)}}
  end
  def handle_info({:EXIT, pid, reason}, state = %{fail: fail, tasks: tasks}) do
    # TODO: Restart failed jobs
    title = Map.fetch!(tasks, pid)
    {:noreply, %{state | fail: [{DateTime.utc_now(), title, reason} | fail], tasks: Map.delete(tasks, pid)}}
  end

  @impl true
  def terminate(reason, %{tasks: tasks}) do
    pids = Map.keys(tasks)
    Enum.each(pids, fn pid -> Process.exit(pid, "Fetch server shutting down with reason #{reason}") end)
  end
  def terminate(_reason, _state) do
    IO.inspect("Fetch server shutting down")
  end

  @impl true
  def handle_call(:stats, _from, state) do
    stats = Map.take(state, [:success, :fail])
    {:reply, stats, state}
  end

  # Fetch implementation
  defp run do
    Logger.info("Starting an RSS fetch run at #{Timex.now()}")
    feeds = RSS.list_fetchable_feeds()

    Enum.reduce(feeds, %{}, fn feed, acc ->
      {:ok, pid} = Task.start_link(fn ->
        fetch(feed)
        Logger.info("Fetched #{feed.url}!")
      end)

      Map.put(acc, pid, feed.title)
    end)
  end

  def fetch(feed) do
    with {:ok, %{body: body}} <- HTTPoison.get(feed.url, [], follow_redirect: true) do
      atom_entries = xpath(body, ~x"//feed/entry"l, title: ~x"./title/text()"s, url: ~x"./id/text()"s, html: ~x"./content/text()"s)
      rss_entries = xpath(body, ~x"//item"l, title: ~x"./title/text()"s, url: ~x"./link/text()"s, html: ~x"./description/text()"s)

      entries = atom_entries ++ rss_entries

      for entry <- entries, include?(entry), do: RSS.create_item(Map.merge(%{feed_id: feed.id}, entry))
      RSS.update_feed(feed, %{last_updated_on_time: Timex.now()})
    end
  end

  defp include?(%{title: title}) do
    filters = [
      !String.contains?(title, "Sponsored Post")
    ]

    Enum.all?(filters)
  end
end
