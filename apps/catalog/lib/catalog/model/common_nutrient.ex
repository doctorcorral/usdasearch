defmodule Catalog.CommonNutrient do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @params ~w(day0
             day1
             day2
             day3
             day4
             day5
             day6
             first_day_of_week
             week_score_goal
             week_score
             score
             user_id
             week_since_epoch)a
  @derive {Poison.Encoder, only: @params}

  schema "common_nutrient" do
    field(:day0, :boolean, default: false)

    belongs_to(:user, User)
  end

  def changeset(common_nutrient, params \\ %{}) do
    common_nutrient
    |> cast(params, @params)
    |> cast_assoc(:user)
  end
end
