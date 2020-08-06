defmodule Headline.RSS do
  @moduledoc """
  The RSS context.
  """

  import Ecto.Query, warn: false
  alias Headline.Repo

  alias Headline.RSS.{Feed, Group, Item}

  def list_feeds(), do: Repo.all(Feed)

  def list_feeds_by_group() do
    query =
      from g in Group,
        join: f in assoc(g, :feeds),
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

  def list_groups(), do: Repo.all(Group)

  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  def list_items(), do: Repo.all(Item)
  def list_unread_items(), do: Repo.all(from i in Item, where: i.is_read == false)
  def list_saved_items(), do: Repo.all(from i in Item, where: i.is_saved == true)

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end
end
