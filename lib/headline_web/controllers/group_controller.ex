defmodule HeadlineWeb.GroupController do
  use HeadlineWeb, :controller

  alias Headline.RSS
  alias Headline.RSS.Group

  action_fallback HeadlineWeb.FallbackController

  def index(conn, _params) do
    groups = RSS.list_groups()
    feeds_by_group = RSS.list_feeds_by_group()
    render(conn, "index.json", groups: groups, feeds_by_group: feeds_by_group)
  end

  def create(conn, %{"group" => group_params}) do
    with {:ok, %Group{} = group} <- RSS.create_group(group_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.group_path(conn, :show, group))
      |> render("show.json", group: group)
    end
  end

  def show(conn, %{"id" => id}) do
    group = RSS.get_group!(id)
    render(conn, "show.json", group: group)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = RSS.get_group!(id)

    with {:ok, %Group{} = group} <- RSS.update_group(group, group_params) do
      render(conn, "show.json", group: group)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = RSS.get_group!(id)

    with {:ok, %Group{}} <- RSS.delete_group(group) do
      send_resp(conn, :no_content, "")
    end
  end
end
