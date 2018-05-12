defmodule Catalog.FoodGroup do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Catalog.Food

  @params ~w(id name)a

  @derive {Poison.Encoder, only: @params}

  schema "food_group" do
    field(:name, :string)

    has_many(:foods, Food)
  end

  def changeset(food_group, params \\ %{}) do
    food_group
    |> cast(params, @params)
    |> cast_assoc(:foods)
  end
end
