use Mix.Config

config :pre_commit,
  commands: ["format --check-formatted", "credo", "test"],
  verbose: true
