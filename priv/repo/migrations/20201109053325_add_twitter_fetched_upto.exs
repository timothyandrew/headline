defmodule Headline.Repo.Migrations.AddTwitterFetchedUpto do
  use Ecto.Migration

  def change do
    alter table("feeds") do
      add :twitter_fetched_upto_id, :bigint
    end
  end
end
