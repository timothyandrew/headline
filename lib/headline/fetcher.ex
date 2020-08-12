defmodule Headline.Fetcher do
  import SweetXml
  alias Headline.RSS
  require Logger

  use Task, restart: :permanent

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(%{delay: delay} = opts) do
    Logger.info("Starting an RSS fetch run at #{Timex.now()}")
    feeds = RSS.list_fetchable_feeds()

    for feed <- feeds, do: Task.start(fn ->
      fetch(feed)
      Logger.info("Fetched #{feed.url}!")
    end)

    Process.sleep(delay)
    run(opts)
  end

  def fetch(feed) do
    with {:ok, %{body: body}} <- HTTPoison.get(feed.url) do
      atom_entries = xpath(body, ~x"//feed/entry"l, title: ~x"./title/text()"s, url: ~x"./id/text()"s, html: ~x"./content/text()"s)
      rss_entries = xpath(body, ~x"//item"l, title: ~x"./title/text()"s, url: ~x"./link/text()"s, html: ~x"./description/text()"s)

      entries = atom_entries ++ rss_entries

      for entry <- entries, do: RSS.create_item(Map.merge(%{feed_id: feed.id}, entry))
      RSS.update_feed(feed, %{last_updated_on_time: Timex.now()})
    end
  end
end
