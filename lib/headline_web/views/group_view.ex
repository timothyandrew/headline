defmodule HeadlineWeb.GroupView do
  use HeadlineWeb, :view
  alias HeadlineWeb.GroupView

  def render("index.json", %{groups: groups}) do
    %{data: render_many(groups, GroupView, "group.json")}
  end

  def render("show.json", %{group: group}) do
    %{
      groups: render_one(group, GroupView, "group.json")
    }
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id,
      title: group.title
    }
  end
end
