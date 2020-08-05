defmodule HeadlineWeb.ItemView do
  use HeadlineWeb, :view
  alias HeadlineWeb.ItemView

  def render("index.json", %{items: items}) do
    %{data: render_many(items, ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      title: item.title,
      author: item.author,
      html: item.html,
      url: item.url,
      is_saved: item.is_saved,
      is_read: item.is_read}
  end
end
