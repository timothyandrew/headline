defmodule HeadlineWeb.ItemController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias Headline.RSS.Item

  action_fallback HeadlineWeb.FallbackController

  def index(conn, params) do
    filters = Map.take(params, ["since_id", "max_id", "with_ids"])
    filters = case Map.fetch(filters, "with_ids") do
      {:ok, with_ids} -> Map.put(filters, "with_ids", String.split(with_ids, ","))
      :error -> filters
    end

    items = RSS.list_items(filters)

    render(conn, "index.json", items: items)
  end

  def update(conn, %{"id" => id, "as" => as}) do
    item = RSS.get_item!(id)

    with {:ok, %Item{} = _item} <- RSS.update_item_status(item, as) do
      case as do
        "read" -> render(conn, "unread.json", items: RSS.list_unread_items())
        "unread" -> render(conn, "unread.json", items: RSS.list_unread_items())
        "saved" -> render(conn, "saved.json", items: RSS.list_saved_items())
        "unsaved" -> render(conn, "saved.json", items: RSS.list_saved_items())
      end
    end
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
