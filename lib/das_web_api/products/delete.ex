defmodule DasWebApi.Products.Delete do

  alias DasWebApi.Repo
  alias DasWebApi.Product

  def call(%{"id" => id, "description" => description}) do
    product = Repo.get(Product, id)
    case product do
      nil -> nil
      _ -> Repo.delete(product)
    end
  end
end
