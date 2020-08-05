defmodule HeadlineWeb.FeedView do
  use HeadlineWeb, :view
  alias HeadlineWeb.FeedView

  def render("index.json", %{feeds: feeds}) do
    %{data: render_many(feeds, FeedView, "feed.json")}
  end

  def render("show.json", %{feed: feed}) do
    %{data: render_one(feed, FeedView, "feed.json")}
  end

  def render("feed.json", %{feed: feed}) do
    %{id: feed.id,
      title: feed.title,
      url: feed.url,
      site_url: feed.site_url,
      is_spark: feed.is_spark,
      last_updated_on_time: feed.last_updated_on_time}
  end
end
