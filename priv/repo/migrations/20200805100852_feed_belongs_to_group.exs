defmodule Headline.Repo.Migrations.FeedBelongsToGroup do
  use Ecto.Migration

  def change do
    alter table("feeds") do
      add :group_id, references("groups", on_delete: :nilify_all)
    end

    create index("feeds", [:group_id])
  end
end
