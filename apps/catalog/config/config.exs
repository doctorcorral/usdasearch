use Mix.Config

config :catalog,
  ecto_repos: [
    Catalog.Repo
  ]

import_config "#{Mix.env()}.exs"
