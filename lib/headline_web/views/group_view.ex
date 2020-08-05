defmodule HeadlineWeb.GroupView do
  use HeadlineWeb, :view
  alias HeadlineWeb.GroupView

  def render("index.json", %{groups: groups, feeds_by_group: feeds_by_group}) do
    %{
      groups: render_many(groups, GroupView, "group.json"),
      feeds_groups: feeds_by_group
    }
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id,
      title: group.title
    }
  end
end
