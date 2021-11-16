defmodule DasWebApi.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:first_name, :last_name, :cpf]

  schema "customers" do
    field :first_name, :string
    field :last_name, :string
    field :cpf, :string
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:cpf])
  end

end
