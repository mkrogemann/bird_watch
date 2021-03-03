# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :bird_watch, BirdWatchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uATboE7xe64yJpO+0VgSI56MDhQBILIWcRwr+CL+01K9PNyLPyolPDKoAlbjLHnQ",
  pubsub_server: BirdWatch.PubSub,
  render_errors: [accepts: ~w(html json)],
  live_view: [signing_salt: "HNKcYMPI"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Poison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
