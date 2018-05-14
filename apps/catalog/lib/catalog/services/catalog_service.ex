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
    |> do_indexed_search()
    |> send_result(state)
  end

  def handle_call({:simple_search, search_term}, _from, state) do
    search_term
    |> do_search_without_index()
    |> send_result(state)
  end

  defp send_result(result, state), do: {:reply, result, state}

  defp do_indexed_search(search_term) do
    search_term
    |> search_query_with_index()
    |> Repo.all()
  end

  defp do_search_without_index(search_term) do
    search_term
    |> search_query_no_index()
    |> Repo.all()
  end

  defp search_query_with_index(search_term, limit \\ 0.2) do
    from(f in Food,
      where: fragment("similarity(?, ?) > ?", f.long_desc, ^search_term, ^limit))
  end

  defp search_query_no_index(search_term) do
    from(f in Food, where: like(f.long_desc, ^"%#{search_term}%"))
  end
end
