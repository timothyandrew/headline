defmodule Headline.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :author, :string
      add :html, :string
      add :url, :string
      add :is_saved, :boolean, default: false, null: false
      add :is_read, :boolean, default: false, null: false
      add :feed_id, references(:feeds, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:items, [:feed_id])
  end
end
