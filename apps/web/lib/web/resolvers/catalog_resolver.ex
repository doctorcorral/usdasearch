defmodule Web.CatalogResolver do
  alias Catalog.CatalogService

  def usda_items(_root, args, _info) do
    items =
      CatalogService
      |> GenServer.call({:search, args})

    {:ok, items}
  end
end
