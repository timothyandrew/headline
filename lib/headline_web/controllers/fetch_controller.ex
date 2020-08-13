defmodule HeadlineWeb.FetchController do
  use HeadlineWeb, :controller
  action_fallback HeadlineWeb.FallbackController


  def create(conn, _params) do
    Headline.Fetcher.start()
    send_resp(conn, 200, "OK")
  end
end
