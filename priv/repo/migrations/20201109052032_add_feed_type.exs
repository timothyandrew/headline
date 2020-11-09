defmodule Headline.Repo.Migrations.AddFeedType do
  use Ecto.Migration

  def change do
    FeedType.create_type

    alter table("feeds") do
      add :type, FeedType.type(), default: "rss"
    end

    execute "update feeds set type = 'local' where url IS NULL"
  end
end
