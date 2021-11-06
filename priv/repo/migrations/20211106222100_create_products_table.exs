defmodule DasWebApi.Repo.Migrations.CreateProductsTable do
  use Ecto.Migration

  def change do
    create table :products do
      add :description, :string

      timestamps
    end

    create unique_index(:products, [:description])
  end
end
