defmodule DasWebApi.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :description]}

  schema "products" do
    field :description, :string
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
    |> unique_constraint([:description])
  end

end
