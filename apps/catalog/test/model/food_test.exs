defmodule Catlog.FoodTest do
  use Catalog.DataCase
  alias Catalog.Food

  test "query for food" do
    last_word =
      insert(:food).long_desc
      |> String.split(" ")
      |> List.last()

    term = last_word
    query = from(f in Food, where: like(f.long_desc, ^"%#{term}%"))
    assert(length(Repo.all(query)) > 0)
  end
end
