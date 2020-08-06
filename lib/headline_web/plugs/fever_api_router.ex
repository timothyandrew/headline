defmodule HeadlineWeb.Plugs.FeverApiRouter do
  alias HeadlineWeb.{GroupController,FeedController, ItemController}

  use Plug.Builder

  plug :common
  plug :groups
  plug :feeds
  plug :items
  plug :unread_items
  plug :saved_items
  plug :mark
  plug :fallthrough

  def common(conn, opts) do
    fetch_query_params(conn)

    case Map.fetch(conn.params, "api") do
      {:ok, "xml"} ->
        conn
        |> send_resp(:not_implemented, "XML isn't implemented yet.")
        |> halt()
      {:ok, _} -> conn
      :error -> fallthrough(conn, opts)
    end
  end

  def groups(conn, _opts) do
    case Map.has_key?(conn.params, "groups") do
      true -> conn |> GroupController.call(:index) |> halt()
      false -> conn
    end
  end

  def feeds(conn, _opts) do
    case Map.has_key?(conn.params, "feeds") do
      true -> conn |> FeedController.call(:index) |> halt()
      false -> conn
    end
  end

  def items(conn, _opts) do
    case Map.has_key?(conn.params, "items") do
      true -> conn |> ItemController.call(:index) |> halt()
      false -> conn
    end
  end

  def unread_items(conn, _opts) do
    case Map.has_key?(conn.params, "unread_item_ids") do
      true -> conn |> ItemController.call(:unread) |> halt()
      false -> conn
    end
  end

  def saved_items(conn, _opts) do
    case Map.has_key?(conn.params, "saved_item_ids") do
      true -> conn |> ItemController.call(:saved) |> halt()
      false -> conn
    end
  end

  def mark(conn, _opts) do
    case Map.fetch(conn.params, "mark") do
      {:ok, "item"} -> conn |> ItemController.call(:update) |> halt()
      {:ok, "feed"} -> conn |> FeedController.call(:update) |> halt()
      {:ok, "group"} -> conn |> GroupController.call(:update) |> halt()
      {:ok, _} -> conn
      :error -> conn
    end
  end


  def fallthrough(conn, _opts) do
    resp = Jason.encode!(HeadlineWeb.BaseView.render("base.json", %{}), %{})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:ok, resp)
    |> halt()
  end
end
