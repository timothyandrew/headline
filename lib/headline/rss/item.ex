defmodule Headline.RSS.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Headline.RSS.Feed

  schema "items" do
    field :author, :string
    field :html, :string
    field :is_read, :boolean, default: false
    field :is_saved, :boolean, default: false
    field :title, :string
    field :url, :string
    belongs_to :feed, Feed

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :author, :html, :url, :is_saved, :is_read, :feed_id])
    |> validate_required([:title, :url, :is_saved, :is_read, :feed_id])
  end
end
