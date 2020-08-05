defmodule HeadlineWeb.PageController do
  use HeadlineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
