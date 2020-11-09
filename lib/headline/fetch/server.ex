# TODO: Possibly use a `Task.Supervisor` to restart individual fetch jobs.
defmodule Headline.Fetch.Server do
  alias Headline.Fetch.Run
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
    {:ok, Map.merge(state, %{delay: Map.get(state, :delay, 3600000)}), {:continue, :fetch}}
  end

  @impl true
  def handle_continue(:fetch, state) do
    :ok = Process.send(self(), :fetch, [])
    {:noreply, state}
  end

  @impl true
  def handle_info(:fetch, state = %{delay: delay}) do
    # TODO: Terminate existing jobs
    run = %Run{run_id: DateTime.utc_now(), tasks: run()}
    Process.send_after(self(), :fetch, delay)
    {:noreply, Map.update(state, :runs, [run], fn runs -> [run | Enum.take(runs, 5)] end)}
  end

  @impl true
  def handle_info({:EXIT, pid, :normal}, state = %{runs: [run | runs]}) do
    title = Map.fetch!(run.tasks, pid)
    run = %{ run | success: [{DateTime.utc_now(), title} | run.success], tasks: Map.delete(run.tasks, pid) }
    {:noreply, %{state | runs: [run | runs]}}
  end
  def handle_info({:EXIT, pid, reason}, state = %{runs: [run | runs]}) do
    title = Map.fetch!(run.tasks, pid)
    run = %{ run | fail: [{DateTime.utc_now(), title, reason} | run.fail], tasks: Map.delete(run.tasks, pid) }
    {:noreply, %{state | runs: [run | runs]}}
  end

  @impl true
  def terminate(_reason, _state), do: IO.inspect("Fetch server shutting down")

  @impl true
  def handle_call(:stats, _from, state) do
    stats = Map.take(state, [:runs])
    {:reply, stats, state}
  end

  # Fetch implementation
  def run do
    Map.merge(Headline.Fetch.Feed.run(), Headline.Fetch.Twitter.run())
  end
end
