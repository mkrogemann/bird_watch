defmodule BirdWatch.Router do
  use BirdWatch.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", BirdWatch do
    pipe_through :browser

    resources "/", BirdController, only: [:index] do
      resources "/sightings", SightingsController, only: [:index, :new, :create]
    end
  end
end
