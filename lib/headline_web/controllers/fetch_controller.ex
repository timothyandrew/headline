defmodule HeadlineWeb.FetchController do
  use HeadlineWeb, :controller
  action_fallback HeadlineWeb.FallbackController

  def show(conn, _params) do
    stats = Headline.Fetch.Server.stats()
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(stats))
  end


  def create(conn, _params) do
    Headline.Fetch.Server.start_run()
    send_resp(conn, 200, "OK")
  end
end
