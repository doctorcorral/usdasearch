defmodule Catalog.Factory do
  @moduledoc """
  Data factory for testing.
  """
  alias Catalog.{Repo, FoodGroup, Food}
  use ExMachina.Ecto, repo: Repo

  alias Faker.Beer

  def food_group_factory do
    %FoodGroup{
      name: Beer.style
    }
  end

  def food_factory do
    %Food{
      short_desc: Beer.hop,
      long_desc: Beer.name,
      food_group: build(:food_group)
    }
  end
end
