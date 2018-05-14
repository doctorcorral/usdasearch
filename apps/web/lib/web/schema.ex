defmodule Web.Schema do
  use Absinthe.Schema

  alias Web.CatalogResolver

  query do
    field :usda_items, list_of(:usda_item) do
      arg(:matching, :string)
      resolve(&CatalogResolver.usda_items/3)
    end
  end

  object :usda_item do
    field(:id, :id)
    field(:long_desc, :string)
  end
end
