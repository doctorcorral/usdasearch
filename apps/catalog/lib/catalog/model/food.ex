defmodule Catalog.Food do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Catalog.{FoodGroup, Weight}

  @params ~w(id
             food_group
             short_desc
             long_desc
             common_names
             manufac_name
             survey
             ref_desc
             refuse
             sci_name
             nitrogen_factor
             protein_factor
             fat_factor
             calorie_factor)a

  @derive {Poison.Encoder, only: @params}

  schema "food" do
    field(:short_desc, :string)
    field(:long_desc, :string)
    field(:common_names, :string)
    field(:manufac_name, :string)
    field(:survey, :string)
    field(:ref_desc, :string)
    field(:refuse, :integer)
    field(:sci_name, :string)
    field(:nitrogen_factor, :float)
    field(:protein_factor, :float)
    field(:fat_factor, :float)
    field(:calorie_factor, :float)

    has_one(:weight, Weight)
    belongs_to(:food_group, FoodGroup)
  end

  def changeset(food, params \\ %{}) do
    food
    |> cast(params, @params)
    |> cast_assoc(:weight)
    |> cast_assoc(:food_group)
  end
end
