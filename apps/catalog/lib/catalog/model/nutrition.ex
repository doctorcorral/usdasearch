defmodule Catalog.Nutrition do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Catalog.{Food, Nutrient}
  @params ~w(amount
             num_data_points
             std_error
             source_code
             derivation_code
             reference_food_id
             added_nutrient
             num_studients
             min
             max
             degrees_freedom
             lower_error_bound
             upper_error_bound
             comments)a

  @derive {Poison.Encoder, only: @params}

  schema "nutrition" do
    field(:amount, :float)
    field(:num_data_points, :integer)
    field(:std_error, :float)
    field(:source_code, :integer)
    field(:derivation_code, :string)
    field(:reference_food_id, :integer)
    field(:added_nutrient, :string)
    field(:num_studients, :string)
    field(:min, :float)
    field(:max, :float)
    field(:degrees_freedom, :integer)
    field(:lower_error_bound, :float)
    field(:upper_error_bound, :float)
    field(:comments, :integer)
    #field(:modification_date, :string)
    #field(:confidence_code, :string)

    belongs_to(:food, Food)
    belongs_to(:nutrient, Nutrient)
  end

  def changeset(nutrition, params \\ %{}) do
    nutrition
    |> cast(params, @params)
    |> cast_assoc(:user)
  end
end
