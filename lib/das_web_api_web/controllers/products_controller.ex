defmodule DasWebApiWeb.ProductsController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Product
  alias DasWebApi.Repo

  action_fallback DasWebApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Product{} = product} <- DasWebApi.create_product(params) do
      conn
      |> put_status(:created)
      |> render("create.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    with %Product{} = product <- DasWebApi.Repo.get(DasWebApi.Product, id) do
      conn
      |> put_status(:ok)
      |> render("show.json", product: product)
    end
  end

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", products: Repo.all(Product))
  end
end
