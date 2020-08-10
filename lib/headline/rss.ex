defmodule Headline.RSS do
  @moduledoc """
  The RSS context.
  """

  use Timex
  import Ecto.Query, warn: false
  alias Headline.Repo

  alias Headline.RSS.{Feed, Group, Item}

  def get_feed!(id), do: Repo.get!(Feed, id)

  def list_feeds(), do: Repo.all(from f in Feed, where: not(is_nil(f.last_updated_on_time)))
  def list_fetchable_feeds, do: Repo.all(from f in Feed, where: not(is_nil(f.url)))

  def list_feeds_preloading_unread_items() do
    Repo.all(from f in Feed,
      left_join: i in assoc(f, :items),
      where: i.is_read == false,
      order_by: [desc: i.inserted_at],
      preload: [items: i])
  end

  def list_feeds_by_group() do
    query =
      from g in Group,
        left_join: f in assoc(g, :feeds),
        group_by: g.id,
        select: %{
          group_id: g.id,
          feed_ids: fragment("ARRAY_AGG(?)", f.id)
        }

    Repo.all(query)
  end

  def create_feed(attrs \\ %{}) do
    %Feed{}
    |> Feed.changeset(attrs)
    |> Repo.insert()
  end

  def mark_feed_read(%Feed{} = feed, before) do
    bound = case Integer.parse(before) do
      :error -> raise "Couldn't parse `before`"
      {i, _} -> Timex.from_unix(i)
    end

    query = from i in Item,
      inner_join: f in assoc(i, :feed),
      where: i.inserted_at < ^bound and f.id == ^feed.id

    Repo.update_all(query, set: [is_read: true])
  end

  def get_group!(id) do
    case id do
      # Group 0 is the "All Items" meta-group
      "0" -> %Group{id: 0}
       _ -> Repo.get!(Group, id)
    end
  end

  def list_groups(), do: Repo.all(Group)

  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  def mark_group_read(%Group{} = group, before) do
    bound = case Integer.parse(before) do
      :error -> raise "Couldn't parse `before`"
      {i, _} -> Timex.from_unix(i)
    end

    condition = case group.id do
      # Group 0 is the "All Items" meta-group
      0 -> dynamic([i], i.inserted_at < ^bound)
      _ -> dynamic([i, g], i.inserted_at < ^bound and g.id == ^group.id)
    end

    IO.inspect(condition)

    query = from i in Item,
      inner_join: f in assoc(i, :feed),
      inner_join: g in assoc(f, :group),
      where: ^condition

    Repo.update_all(query, set: [is_read: true])
  end

  def get_item!(id), do: Repo.get!(Item, id)

  def list_items(%{"since_id" => id}) do
    query = from i in Item,
      where: i.id > ^id,
      limit: 50,
      order_by: [asc: i.id],
      select: i

    Repo.all(query)
  end
  def list_items(%{"max_id" => id}) do
    query = from i in Item,
      where: i.id < ^id,
      limit: 50,
      order_by: [desc: i.id],
      select: i

    Repo.all(query)
  end
  def list_items(%{"with_ids" => ids}) do
    query = from i in Item,
      where: i.id in ^ids,
      limit: 50,
      select: i

    Repo.all(query)
  end
  def list_items(%{}), do: Repo.all(Item)

  def get_random_item_nohtml do
    query = from i in Item,
      where: is_nil(i.html),
      order_by: fragment("RANDOM()"),
      limit: 1,
      select: i

    Repo.one(query)
  end

  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  def update_feed(%Feed{} = feed, attrs) do
    feed
    |> Feed.changeset(attrs)
    |> Repo.update()
  end


  def list_unread_items(), do: Repo.all(from i in Item, where: i.is_read == false)
  def list_saved_items(), do: Repo.all(from i in Item, where: i.is_saved == true)

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  def update_item_status(%Item{} = item, status) do
    changeset = case status do
      "read" -> Item.changeset(item, %{is_read: true})
      "unread" -> Item.changeset(item, %{is_read: false})
      "saved" -> Item.changeset(item, %{is_saved: true})
      "unsaved" -> Item.changeset(item, %{is_saved: false})
    end

    Repo.update(changeset)
  end
end
