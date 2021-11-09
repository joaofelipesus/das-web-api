defmodule DasWebApiWeb.ProductsView do
  use DasWebApiWeb, :view

  alias DasWebApi.Product

  def render("product.json", %{product: %Product{} = product}), do: render_product(product)

  def render("index.json", %{products: products}) do
    %{
      products: Enum.map(products, fn product -> render_product(product) end)
    }
  end

  def render("delete.json", %{product: %Product{} = product}) do
    %{
      id: nil,
      description: product.description
    }
  end

  defp render_product(product) do
    %{product: product}
  end
end
