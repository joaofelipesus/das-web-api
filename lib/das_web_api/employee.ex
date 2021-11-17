defmodule DasWebApi.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :age]

  @derive {Jason.Encoder, only: [:id, :name, :age]}

  schema "employees" do
    field :name, :string
    field :age, :integer
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required([:name, :age])
    |> unique_constraint([:name])
  end
end
