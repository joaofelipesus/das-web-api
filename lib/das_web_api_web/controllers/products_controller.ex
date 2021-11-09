defmodule DasWebApiWeb.ProductsController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Product
  alias DasWebApi.Repo

  def create(conn, params) do
    result = params
    |> Product.changeset
    |> Repo.insert
    case result do
      {:ok, product} ->
        conn
        |> put_status(:created)
        |> render("create.json", product: product)
      {:error, messages} ->
        IO.puts(messages)
        conn
        |> put_status(:bad_request)
    end
  end
end
