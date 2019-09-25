# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zolesha,
  ecto_repos: [Zolesha.Repo]

# Configures the endpoint
config :zolesha, ZoleshaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ydP+f7LEiY3wC8hjJzdRG+7fd72ZnJK7OXeAf/cWBt0/9DZkHFaz1JcjdrXiTLzA",
  render_errors: [view: ZoleshaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Zolesha.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Sentry Config
config :sentry, dsn: Application.get_env(:sentry_setup, :sentry_url),
  included_environments: ~w(production staging),
  environment_name: System.get_env("RELEASE_LEVEL") || "development"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
