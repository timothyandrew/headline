defmodule HeadlineWeb.ItemController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias Headline.RSS.Item

  action_fallback HeadlineWeb.FallbackController

  def index(conn, _params) do
    # TODO: Filtering via the `since_id`, `max_id`, and `with_ids` parameters
    items = RSS.list_items()
    render(conn, "index.json", items: items)
  end

  def unread(conn, _params) do
    items = RSS.list_unread_items()
    render(conn, "unread.json", items: items)
  end

  def saved(conn, _params) do
    items = RSS.list_saved_items()
    render(conn, "saved.json", items: items)
  end
end
