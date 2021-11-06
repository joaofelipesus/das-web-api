defmodule DasWebApi.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "products" do
    field :description, :string
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:description])
    |> validate_required([:description])
    |> unique_constraint([:description])
  end

end
