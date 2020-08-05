defmodule Headline.Repo.Migrations.CreateFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds) do
      add :title, :string
      add :url, :string
      add :site_url, :string
      add :is_spark, :boolean, default: false, null: false
      add :last_updated_on_time, :utc_datetime

      timestamps()
    end

  end
end
