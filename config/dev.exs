use Mix.Config

config :pre_commit,
  commands: ["format", "credo", "test"],
  verbose: true
