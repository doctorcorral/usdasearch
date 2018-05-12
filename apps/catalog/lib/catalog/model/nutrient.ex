defmodule Catalog.Nutrient do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @params ~w(units
             tagname
             name
             num_decimal_places
             sr_order)a

  @derive {Poison.Encoder, only: @params}

  schema "nutrient" do
    field(:units, :string)
    field(:tagname, :string)
    field(:name, :string)
    field(:num_decimal_places, :integer)
    field(:sr_order, :integer)
  end

  def changeset(nutrient, params \\ %{}) do
    nutrient
    |> cast(params, @params)
  end
end
