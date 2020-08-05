defmodule Headline.RSS.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :author, :string
    field :html, :string
    field :is_read, :boolean, default: false
    field :is_saved, :boolean, default: false
    field :title, :string
    field :url, :string
    field :feed, :id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :author, :html, :url, :is_saved, :is_read])
    |> validate_required([:title, :author, :html, :url, :is_saved, :is_read])
  end
end
