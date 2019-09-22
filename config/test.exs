use Mix.Config

# Configure your database
config :zolesha, Zolesha.Repo,
  username: "postgres",
  password: "postgres",
  database: "zolesha_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :zolesha, ZoleshaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
# phoenix_integration
config :phoenix_integration,
  endpoint: Zolesha.Endpoint

# wallaby
config :zolesha, Zolesha.Endpoint, server: true
config :zolesha, :sql_sandbox, true
config :wallaby, screenshot_on_failure: true
