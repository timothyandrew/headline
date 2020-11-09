defmodule Headline.Fetch.Twitter do
  require Logger
  alias Headline.RSS

  def run do
    Logger.info("Starting an Twitter fetch run at #{Timex.now()}")
    feeds = RSS.list_twitter_feeds()

    Enum.reduce(feeds, %{}, fn feed, acc ->
      {:ok, pid} = Task.start_link(fn ->
        fetch(feed)
        Logger.info("Fetched #{feed.url}!")
      end)

      Map.put(acc, pid, feed.title)
    end)
  end

  def fetch(feed) do
    auth = "Bearer #{Application.fetch_env!(:headline, __MODULE__)[:token]}"

    url = if feed.twitter_fetched_upto_id do
      "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{feed.url}&since_id=#{feed.twitter_fetched_upto_id}"
    else
      "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=#{feed.url}"
    end

    with {:ok, %{body: body}} = HTTPoison.get(url, [Authorization: auth], follow_redirect: true) do
      tweets = body |> Jason.decode!(keys: :atoms)

      for tweet <- Enum.reverse(tweets) do
        url = get_in(tweet, [:entities, :urls]) |> List.first |> get_in([:url])

        if url == nil, do: IO.inspect(tweet)

        RSS.create_item(%{
          feed_id: feed.id,
          title: tweet.text,
          html: tweet.text,
          url: url
        })
      end

      if tweets && Enum.count(tweets) > 0 do
        RSS.update_feed(feed, %{
          last_updated_on_time: Timex.now(),
          twitter_fetched_upto_id: tweets |> Enum.map(fn tweet -> tweet.id end) |> Enum.max
        })
      else
        RSS.update_feed(feed, %{
          last_updated_on_time: Timex.now()
        })
      end
    end
  end
end
