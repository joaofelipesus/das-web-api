defmodule DasWebApi.Repo.Migrations.CreateCustomersTable do
  use Ecto.Migration

  def change do
    create table :customers do
      add :first_name, :string
      add :last_name, :string
      add :cpf, :string
      timestamps()
    end

    create unique_index(:customers, [:cpf])
  end
end
