defmodule HeadlineWeb.Router do
  use HeadlineWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", HeadlineWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  scope "/api", HeadlineWeb do
    pipe_through :api
    get "/hugo.json", FeedController, :hugo_json
    get "/fetch", FetchController, :show
    post "/fetch", FetchController, :create
  end

  scope "/fever", HeadlineWeb do
    pipe_through :api
    get "/", Plugs.FeverApiRouter, {}
    post "/", Plugs.FeverApiRouter, {}
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: HeadlineWeb.Telemetry
    end
  end
end
