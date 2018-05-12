defmodule Catalog.Weight do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Catalog.Food

  @params ~w(food
             sequence_num
             amount
             description
             gm_weight
             num_data_pts
             std_dev)a

  @derive {Poison.Encoder, only: @params}

  schema "weight" do
    field(:sequence_num, :integer)
    field(:amount, :integer)
    field(:description, :string)
    field(:gm_weight, :float)
    field(:num_data_pts, :integer)
    field(:std_dev, :float)

    belongs_to(:food, Food)
  end

  def changeset(weight, params \\ %{}) do
    weight
    |> cast(params, @params)
    |> cast_assoc(:user)
  end
end
