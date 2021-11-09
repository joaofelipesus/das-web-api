defmodule DasWebApiWeb.ProductsController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Product
  alias DasWebApi.Repo

  action_fallback DasWebApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Product{} = product} <- DasWebApi.create_product(params) do
      conn
      |> put_status(:created)
      |> render("product.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    with %Product{} = product <- DasWebApi.Repo.get(DasWebApi.Product, id) do
      conn
      |> put_status(:ok)
      |> render("product.json", product: product)
    end
  end

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", products: Repo.all(Product))
  end

  def update(conn, params) do
    with {:ok, %Product{} = product} <- DasWebApi.update_product(params) do
      conn
      |> put_status(:ok)
      |> render("product.json", product: product)
    end
  end

  def delete(conn, params) do
    with {:ok, %Product{} = product} <- DasWebApi.delete_product(params) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
