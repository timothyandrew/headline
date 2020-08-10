defmodule Headline.Repo.Migrations.HtmlTextNotVarchar do
  use Ecto.Migration

  def change do
    alter table("items") do
      modify :html, :text
    end
  end
end
