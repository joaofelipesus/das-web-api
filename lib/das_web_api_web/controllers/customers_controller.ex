defmodule DasWebApiWeb.CustomersController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Customer

  action_fallback DasWebApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %DasWebApi.Customer{} = customer} <- DasWebApi.create_customer(params) do
      conn
      |> put_status(:created)
      |> render("customer.json", customer: customer)
    end
  end

  def show(conn, %{"id" => id}) do
    with %Customer{} = customer <- DasWebApi.find_customer(id) do
      conn
      |> put_status(:ok)
      |> render("customer.json", customer: customer)
    end
  end

  def index(conn, _params) do
    customers = DasWebApi.Repo.all(DasWebApi.Customer)
    conn
    |> put_status(:ok)
    |> render("index.json", customers: customers)
  end
end
