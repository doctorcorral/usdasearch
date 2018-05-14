use Mix.Config

config :pre_commit,
  commands: ["format --check-formatted", "credo --strict", "test"],
  verbose: true
