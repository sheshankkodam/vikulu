# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :vikulu,
  ecto_repos: [Vikulu.Repo]

# Configures the endpoint
config :vikulu, VikuluWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "v+3sZj++UGvwwhG3q8OXcDGLnim7AssmesP758u3VbjUnu7+MiHv7/xAi4tXqLxr",
  render_errors: [view: VikuluWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vikulu.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
