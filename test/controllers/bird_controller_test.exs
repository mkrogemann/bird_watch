defmodule BirdWatch.BirdControllerTest do
  use ExUnit.Case
  use Phoenix.ConnTest

  @endpoint BirdWatch.Endpoint

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "European Robin"
  end

end
