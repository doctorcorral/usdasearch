defmodule Catalog.Supervisor do
  @moduledoc false
  use Supervisor
  alias Catalog.Repo

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_args) do
    supervise(children(), strategy: :one_for_one)
  end

  defp children do
    [
      supervisor(Repo, [])
    ]
  end
end
