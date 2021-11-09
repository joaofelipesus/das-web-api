defmodule DasWebApiWeb.ProductsController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Product

  action_fallback DasWebApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Product{} = product} <- DasWebApi.create_product(params) do
      conn
      |> put_status(:created)
      |> render("create.json", product: product)
    end
  end
end
