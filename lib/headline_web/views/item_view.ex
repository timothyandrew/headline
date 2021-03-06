defmodule HeadlineWeb.ItemView do
  use HeadlineWeb, :view
  alias HeadlineWeb.{Util, ItemView, BaseView}

  def render("index.json", %{items: items}) do
    Map.merge(
      render(BaseView, "base.json", %{}),
      %{items: render_many(items, ItemView, "item.json"),
        # TODO: This will be inaccurate once the controller implements filtering
        total_items: Enum.count(items)}
    )
  end

  def render("unread.json", %{items: items}) do
    Map.merge(
      render(BaseView, "base.json", %{}),
      %{unread_item_ids: Enum.join(Enum.map(items, fn i -> i.id end), ",")}
    )
  end

  def render("saved.json", %{items: items}) do
    Map.merge(
      render(BaseView, "base.json", %{}),
      %{saved_item_ids: Enum.join(Enum.map(items, fn i -> i.id end), ",")}
    )
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      title: item.title,
      author: item.author,
      html: item.html,
      url: item.url,
      feed_id: item.feed_id,
      created_on_time: Timex.to_unix(item.inserted_at),
      is_saved: Util.bool_to_int(item.is_saved),
      is_read: Util.bool_to_int(item.is_read)}
  end
end
