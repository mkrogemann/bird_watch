defmodule BirdWatch.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bird_watch,
      version: "0.1.0",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {BirdWatch.Application, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :httpoison, :couchdb_connector]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.3"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.2.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:httpoison, "~> 0.10"},
      {:coverex, "~> 1.5.0", only: [:dev, :test]},
      {:credo, "~> 1.5.5", only: [:dev, :test], runtime: false},
      {:poison, "~> 3.0"},
      {:couchdb_connector, "~> 0.5"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
