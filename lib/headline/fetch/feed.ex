defmodule Headline.Fetch.Feed do
  require Logger
  import SweetXml
  alias Headline.RSS

  def run do
    Logger.info("Starting an RSS fetch run at #{Timex.now()}")
    feeds = RSS.list_rss_feeds()

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

  def include?(%{title: title}) do
    filters = [
      !String.contains?(title, "Sponsored Post")
    ]

    Enum.all?(filters)
  end
end
