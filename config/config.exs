# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :headline,
  ecto_repos: [Headline.Repo]

# Configures the endpoint
config :headline, HeadlineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8R1rKnXoLW83H5Fq0rMgogBnldryujDrOUXXzKNUPgz/QhvU+LxwxTLYOstXA3Bl",
  render_errors: [view: HeadlineWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Headline.PubSub,
  live_view: [signing_salt: "WNDe50No"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

twitter_bearer_token =
  System.get_env("TWITTER_BEARER_TOKEN") ||
    raise """
    environment variable TWITTER_BEARER_TOKEN is missing.
    """

config :headline, Headline.Fetch.Twitter,
  token: twitter_bearer_token

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
