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

  def create(conn, %{"feed" => feed_params}) do
    with {:ok, %Feed{} = feed} <- RSS.create_feed(feed_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.feed_path(conn, :show, feed))
      |> render("show.json", feed: feed)
    end
  end

  def show(conn, %{"id" => id}) do
    feed = RSS.get_feed!(id)
    render(conn, "show.json", feed: feed)
  end

  def update(conn, %{"id" => id, "feed" => feed_params}) do
    feed = RSS.get_feed!(id)

    with {:ok, %Feed{} = feed} <- RSS.update_feed(feed, feed_params) do
      render(conn, "show.json", feed: feed)
    end
  end

  def delete(conn, %{"id" => id}) do
    feed = RSS.get_feed!(id)

    with {:ok, %Feed{}} <- RSS.delete_feed(feed) do
      send_resp(conn, :no_content, "")
    end
  end
end
