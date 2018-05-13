defmodule Catlog.CatalogServiceTest do
  use Catalog.DataCase
  alias Catalog.CatalogService

  test "query for food" do
    last_word =
      insert(:food).long_desc
      |> String.split(" ")
      |> List.last()

    term = last_word
    result = GenServer.call(CatalogService, {:search, term})
    assert(length(result) > 0)
  end
end
