defmodule DasWebApi.Products.Update do

  alias DasWebApi.Repo
  alias DasWebApi.Product

  def call(%{"id" => id, "description" => description}) do
    product = Repo.get(Product, id)
    case product do
      nil -> nil
      _ ->
        Product.changeset(%{description: description})
        |> Repo.update
    end
  end
end
