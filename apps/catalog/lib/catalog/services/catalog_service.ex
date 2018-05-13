defmodule Catalog.CatalogService do
  @moduledoc """
    CatalogService is a generic service for simple catalog
  data querying.
  """
  use GenServer
  import Ecto.Query, only: [from: 2]
  alias Catalog.{Repo, Food}

  def start_link(_, opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:search, search_term}, _from, state) do
    search_term
    |> do_search()
    |> send_result(state)
  end

  defp send_result(result, state), do: {:reply, result, state}

  defp do_search(search_term) do
    search_term
    |> search_query()
    |> Repo.all()
  end

  defp search_query(term) do
    from(f in Food, where: like(f.long_desc, ^"%#{term}%"))
  end
end
