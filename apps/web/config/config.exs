use Mix.Config

config :web, Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Lc4UPeeaNH9i6+vt3CEXLqaEQJVfNs+HWfhgeDZkO6FKXerMFEUv3DmKuJdCZysz",
  render_errors: [view: Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Web.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
