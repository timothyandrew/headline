defmodule HeadlineWeb.FeedView do
  use HeadlineWeb, :view
  alias HeadlineWeb.FeedView

  def render("index.json", %{feeds: feeds, feeds_by_group: feeds_by_group}) do
    %{
      feeds: render_many(feeds, FeedView, "feed.json"),
      feeds_groups: feeds_by_group
    }
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
