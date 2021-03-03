defmodule BirdWatchWeb.BirdControllerTest do
  use BirdWatchWeb.ConnCase

  test("GET /", %{conn: conn}) do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "European Robin"
  end

end
