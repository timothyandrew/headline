defmodule HeadlineWeb.FeedController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias Headline.RSS.Feed
  alias HeadlineWeb.ItemView

  action_fallback HeadlineWeb.FallbackController

  def index(conn, _params) do
    feeds = RSS.list_feeds()
    feeds_by_group = RSS.list_feeds_by_group()
    render(conn, "index.json", feeds: feeds, feeds_by_group: feeds_by_group)
  end

  def update(conn, %{"id" => id, "as" => "read", "before" => before}) do
    feed = RSS.get_feed!(id)

    with {_, _} <- RSS.mark_feed_read(feed, before) do
      conn
      |> put_view(ItemView)
      |> render("unread.json", items: RSS.list_unread_items())
    end
  end

  def hugo_json(conn, _params) do
    feeds = RSS.list_feeds_hugo()
    render(conn, "hugo.json", feeds: feeds)
  end
end
