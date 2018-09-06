# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pokemon_database,
  ecto_repos: [PokemonDatabase.Repo]

# Configures the endpoint
config :pokemon_database, PokemonDatabaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6AfAwuMWPeJ6pVOMfjmjcb6E0Psk8BUyYbges1ZysjX8QTrkewaW+cXxUcl/norz",
  render_errors: [view: PokemonDatabaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PokemonDatabase.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
