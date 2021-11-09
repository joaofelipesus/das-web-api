defmodule DasWebApiWeb.ProductsView do
  use DasWebApiWeb, :view

  alias DasWebApi.Product

  def render("create.json", %{product: %Product{} = product}) do
    %{
      id: product.id,
      description: product.description
    }
  end
end
