defmodule Headline.Repo.Migrations.ItemUrlUnique do
  use Ecto.Migration

  def change do
    create unique_index(:items, [:feed_id, :url])
  end
end
