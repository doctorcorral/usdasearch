use Mix.Config

config :catalog, Catalog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "usda_catalog_db_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
