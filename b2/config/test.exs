import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :b2, B2.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "b2_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :b2, B2Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "JXgLfvvmEUfwFFTg0bJBcnt5uBq6CbZ/IUJtBEg3x8GH0h3TSWWNkx9yRHefL9JC",
  server: false

# In test we don't send emails.
config :b2, B2.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
