use Mix.Config

config :web, Web.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
