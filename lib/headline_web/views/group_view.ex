defmodule HeadlineWeb.GroupView do
  use HeadlineWeb, :view
  alias HeadlineWeb.{BaseView, FeedView, GroupView}

  def render("index.json", %{groups: groups, feeds_by_group: feeds_by_group}) do
    Map.merge(
      render(BaseView, "base.json", %{}),
      %{
        groups: render_many(groups, GroupView, "group.json"),
        feeds_groups: render_many(feeds_by_group, FeedView, "feeds_by_group.json")
      }
    )
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id,
      title: group.title
    }
  end
end
