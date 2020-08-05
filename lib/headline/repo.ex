defmodule Headline.Repo do
  use Ecto.Repo,
    otp_app: :headline,
    adapter: Ecto.Adapters.Postgres
end
