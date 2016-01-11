defmodule BirdWatch.BirdController do
  use BirdWatch.Web, :controller

  alias BirdWatch.Couchdb

  def index(conn, _params) do
    birds = Couchdb.all_birds
    |> Poison.Parser.parse!
    render conn, "index.html", birds: birds
  end

end
