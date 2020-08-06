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
end
