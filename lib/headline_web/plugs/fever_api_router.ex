defmodule HeadlineWeb.Plugs.FeverApiRouter do
  alias HeadlineWeb.{GroupController,FeedController}

  use Plug.Builder

  plug :common
  plug :groups
  plug :feeds
  plug :items
  plug :fallthrough

  def common(conn, opts) do
    fetch_query_params(conn)

    case Map.fetch(conn.query_params, "api") do
      {:ok, "xml"} ->
        conn
        |> send_resp(:not_implemented, "XML isn't implemented yet.")
        |> halt()
      {:ok, _} -> conn
      :error -> fallthrough(conn, opts)
    end
  end

  def groups(conn, opts) do
    case Map.has_key?(conn.query_params, "groups") do
      true -> conn |> GroupController.call(:index) |> halt()
      false -> conn
    end
  end

  def feeds(conn, opts) do
    case Map.has_key?(conn.query_params, "feeds") do
      true -> conn |> FeedController.call(:index) |> halt()
      false -> conn
    end
  end

  def items(conn, opts) do
    case Map.has_key?(conn.query_params, "items") do
      true -> conn |> ItemController.call(:index) |> halt()
      false -> conn
    end
  end

  def fallthrough(conn, _opts) do
    conn
    |> send_resp(:not_found, "The query parameters you passed don't correspond to a Fever API endpoint, sorry!")
    |> halt()
  end
end
