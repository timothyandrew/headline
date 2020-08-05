defmodule Headline.RSS.Feed do
  use Ecto.Schema
  import Ecto.Changeset
  alias Headline.RSS.{Item, Group}

  schema "feeds" do
    field :is_spark, :boolean, default: false
    field :last_updated_on_time, :utc_datetime
    field :site_url, :string
    field :title, :string
    field :url, :string
    belongs_to :group, Group
    has_many :items, Item

    timestamps()
  end

  @doc false
  def changeset(feed, attrs) do
    feed
    |> cast(attrs, [:title, :url, :site_url, :is_spark, :last_updated_on_time, :group_id])
    |> validate_required([:title, :url, :site_url, :is_spark, :last_updated_on_time])
  end
end
