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
    with {:ok, response} <- HTTPoison.get(feed.url, [], follow_redirect: true) do
      body = maybe_gunzip(response)

      atom_entries = xpath(body, ~x"//feed/entry"l, title: ~x"./title/text()"s, url: ~x"./id/text()"s, html: ~x"./content/text()"s)
      rss_entries = xpath(body, ~x"//item"l, title: ~x"./title/text()"s, url: ~x"./link/text()"s, text: ~x"./description/text()"s, html: ~x"./content:encoded/text()"s)

      rss_entries = Enum.map(rss_entries, fn entry ->
        if is_binary(entry.html) and String.trim(entry.html) != "" do
          Map.delete(entry, :text)
        else
          entry |> Map.put(:html, entry.text) |> Map.delete(:text)
        end
      end)

      entries = atom_entries ++ rss_entries

      for entry <- entries, include?(entry), do: RSS.create_item(Map.merge(%{feed_id: feed.id}, entry))
      RSS.update_feed(feed, %{last_updated_on_time: Timex.now()})
    end
  end

  def maybe_gunzip(response) do
    gzipped = Enum.any?(response.headers, fn (kv) ->
      case kv do
        {"Content-Encoding", "gzip"} -> true
        {"Content-Encoding", "x-gzip"} -> true
        _ -> false
      end
    end)

    if gzipped do
      :zlib.gunzip(response.body)
    else
      response.body
    end
  end

  def include?(%{title: title}) do
    filters = [
      !String.contains?(title, "Sponsored Post")
    ]

    Enum.all?(filters)
  end
end
