defmodule Headline.RSS.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias Headline.RSS.Feed

  schema "groups" do
    field :title, :string
    has_many :feeds, Feed

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
