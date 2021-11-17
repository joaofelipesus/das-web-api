defmodule DasWebApiWeb.CustomersController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Customer
  alias DasWebApi.Repo

  action_fallback DasWebApiWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", customers: Repo.all(Customer))
  end

  def show(conn, %{"id" => id}) do
    with %Customer{} = customer <- DasWebApi.find_customer(id) do
      conn
      |> put_status(:ok)
      |> render("customer.json", customer: customer)
    end
  end

  def create(conn, params) do
    with {:ok, %Customer{} = customer} <- DasWebApi.create_customer(params) do
      conn
      |> put_status(:created)
      |> render("customer.json", customer: customer)
    end
  end

  def update(conn, params) do
     with {:ok, %Customer{} = customer} <- DasWebApi.update_customer(params) do
      conn
      |> put_status(:ok)
      |> render("customer.json", customer: customer)
     end
  end
end
