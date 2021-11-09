defmodule DasWebApiWeb.ProductsView do
  use DasWebApiWeb, :view

  alias DasWebApi.Product

  def render("create.json", %{product: %Product{} = product}) do
    %{
      id: product.id,
      description: product.description
    }
  end

  def render("show.json", %{product: %Product{} = product}) do
    %{
      id: product.id,
      description: product.description
    }
  end

  def render("index.json", %{products: products}) do
    %{
      products: Enum.map(products, fn product ->
        %{
          product: %{
            id: product.id,
            description: product.description
          }
        }
      end)
    }
  end
end
