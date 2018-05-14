defmodule Catalog.MixProject do
  use Mix.Project

  def project do
    [
      app: :catalog,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Catalog, []},
      extra_applications: [:logger, :ecto, :postgrex]
    ]
  end

  defp deps do
    [
      {:postgrex, ">= 0.0.0"},
      {:ecto, "~> 2.2.10"},
      {:poison, "~> 3.1"},
      {:ex_machina, "~> 2.2", only: :test},
      {:faker, "~> 0.10", only: :test}
    ]
  end
end
