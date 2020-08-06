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

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- RSS.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = RSS.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = RSS.get_item!(id)

    with {:ok, %Item{} = item} <- RSS.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = RSS.get_item!(id)

    with {:ok, %Item{}} <- RSS.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
