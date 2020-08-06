defmodule HeadlineWeb.FeedController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias Headline.RSS.Feed

  action_fallback HeadlineWeb.FallbackController

  def index(conn, _params) do
    feeds = RSS.list_feeds()
    feeds_by_group = RSS.list_feeds_by_group()
    render(conn, "index.json", feeds: feeds, feeds_by_group: feeds_by_group)
  end
end
