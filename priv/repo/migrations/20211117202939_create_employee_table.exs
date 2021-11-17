defmodule DasWebApi.Repo.Migrations.CreateEmployeeTable do
  use Ecto.Migration

  def change do
    create table "employees" do
      add :name, :string
      add :age, :integer
      timestamps()
    end

    create unique_index(:employees, [:name])
  end
end
