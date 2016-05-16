defmodule BirdWatch.SightingsController do
  use BirdWatch.Web, :controller

  alias BirdWatch.{Sighting, Couchdb}

  plug :scrub_params, "sighting" when action in [:create]

  def index(conn, _params) do
    bird_link = hd(conn.path_info)
    {:ok, bird} = Couchdb.bird_by_link(bird_link)
    {:ok, sightings} = Couchdb.sightings_by_bird_link(bird_link)
    result_map = %{bird: bird, sightings: sightings}
    render(conn, "index.html", sightings: result_map)
  end
end
