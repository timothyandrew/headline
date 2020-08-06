defmodule HeadlineWeb.GroupController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias HeadlineWeb.ItemView
  alias Headline.RSS.{Feed, Group}

  action_fallback HeadlineWeb.FallbackController

  def index(conn, _params) do
    groups = RSS.list_groups()
    feeds_by_group = RSS.list_feeds_by_group()
    render(conn, "index.json", groups: groups, feeds_by_group: feeds_by_group)
  end

  def update(conn, %{"id" => id, "as" => "read", "before" => before}) do
    group = RSS.get_group!(id)

    with {_, _} <- RSS.mark_group_read(group, before) do
      conn
      |> put_view(ItemView)
      |> render("unread.json", items: RSS.list_unread_items())
    end
  end
end
