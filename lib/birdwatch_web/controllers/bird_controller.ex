defmodule BirdWatchWeb.BirdController do
  use BirdWatchWeb, :controller

  alias BirdWatch.Couchdb

  def index(conn, _params) do
    birds =
      Couchdb.all_birds()
      |> Poison.Parser.parse!()

    render(conn, "index.html", birds: birds)
  end
end
