defmodule Catalog do
  @moduledoc """
  Documentation for Catalog.
  """
  use Application

  def start(_type, _args) do
    Catalog.Supervisor.start_link()
  end
end
