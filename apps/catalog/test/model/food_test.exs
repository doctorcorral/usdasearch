defmodule Catlog.FoodTest do
  use Catalog.DataCase
  alias Catalog.Food

  test "query for food" do
    term = "butter"
    query =
      from f in Food,
        where: like(f.short_desc, ^"%#{term}%")
    assert(length(Repo.all(query)) > 0)
  end
end