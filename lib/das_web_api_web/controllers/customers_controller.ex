defmodule DasWebApiWeb.CustomersController do
  use DasWebApiWeb, :controller

  action_fallback DasWebApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %DasWebApi.Customer{} = customer} <- DasWebApi.create_customer(params) do
      conn
      |> put_status(:created)
      |> render("201.json", customer: customer)
    end
  end
end
