defmodule BirdWatchWeb.Router do
  import Phoenix.LiveDashboard.Router

  use BirdWatchWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BirdWatchWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", BirdController, :index)
    live_dashboard("/dashboard", metrics: BirdWatchWeb.Telemetry)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BirdWatchWeb do
  #   pipe_through :api
  # end
end
