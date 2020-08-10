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
    for feed <- feeds, do: fetch(feed)
    Logger.info("Successfully finished RSS fetch run; sleeping!")
    Process.sleep(delay)
    run(opts)
  end

  def fetch(feed) do
    with {:ok, %{body: body}} <- HTTPoison.get(feed.url) do
      entries = xpath(body, ~x"//feed/entry"l, title: ~x"./title/text()"s, url: ~x"./id/text()"s, html: ~x"./content/text()"s)
      for entry <- entries, do: RSS.create_item(Map.merge(%{feed_id: feed.id}, entry))
      RSS.update_feed(feed, %{last_updated_on_time: Timex.now()})
    end
  end
end
