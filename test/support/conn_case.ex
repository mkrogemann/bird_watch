defmodule BirdWatchWeb.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import BirdWatchWeb.ConnCase

      alias BirdWatchWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint BirdWatchWeb.Endpoint
    end
  end

  setup tags do
    conn =
      Phoenix.ConnTest.build_conn()

    {:ok, conn: conn}
  end
end
