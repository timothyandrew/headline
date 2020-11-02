defmodule Headline.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Headline.Repo,
      HeadlineWeb.Telemetry,
      {Phoenix.PubSub, name: Headline.PubSub},
      HeadlineWeb.Endpoint,
      {Headline.Fetch.Server, %{delay: 3600000}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Headline.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HeadlineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
