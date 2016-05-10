defmodule BirdWatch.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bird_watch,
      version: "0.2.0",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {BirdWatch, []},
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
      {:phoenix, "~> 1.2.0-rc"},
      {:phoenix_html, "~> 2.5"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:cowboy, "~> 1.0"},
      {:httpoison, "~> 0.8"},
      {:coverex, "~> 1.4.7", only: [:dev, :test]},
      {:poison, "~> 1.5"},
      {:couchdb_connector, "~> 0.2"},
      {:credo, "~> 0.3", only: [:dev, :test]}
    ]
  end
end
