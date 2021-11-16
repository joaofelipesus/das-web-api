defmodule DasWebApi.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "customers" do
    field :first_name, :string
    field :last_name, :string
    field :cpf, :string
    timestamps()
  end

end
