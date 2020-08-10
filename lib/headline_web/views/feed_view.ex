defmodule HeadlineWeb.FeedView do
  use HeadlineWeb, :view
  use Timex
  alias HeadlineWeb.{BaseView, ItemView, FeedView, Util}

  def render("index.json", %{feeds: feeds, feeds_by_group: feeds_by_group}) do
    Map.merge(
      render(BaseView, "base.json", %{}),
      %{
        feeds: render_many(feeds, FeedView, "feed.json"),
        feeds_groups: render_many(feeds_by_group, FeedView, "feeds_by_group.json")
      }
    )
  end

  def render("feeds_by_group.json", %{feed: %{feed_ids: feed_ids, group_id: group_id}}) do
    %{group_id: group_id,
      feed_ids: Enum.join(feed_ids, ",")}
  end

  def render("feed.json", %{feed: feed}) do
    %{id: feed.id,
      title: feed.title,
      favicon_id: 1,
      url: feed.url,
      site_url: feed.site_url,
      is_spark: Util.bool_to_int(feed.is_spark),
      last_updated_on_time: Timex.to_unix(feed.last_updated_on_time)}
  end

  def render("feed_with_items.json", %{feed: feed}) do
    %{id: feed.id,
      title: feed.title,
      favicon_id: 1,
      items: render_many(feed.items, ItemView, "item.json"),
      url: feed.url,
      site_url: feed.site_url,
      is_spark: Util.bool_to_int(feed.is_spark),
      last_updated_on_time: Timex.to_unix(feed.last_updated_on_time)}
  end

  def render("hugo.json", %{feeds: feeds}) do
    render_many(feeds, FeedView, "feed_with_items.json")
  end
end
