defmodule Headline.RSS.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
