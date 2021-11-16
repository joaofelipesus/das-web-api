defmodule DasWebApiWeb.CustomersController do
  use DasWebApiWeb, :controller

  def create(conn, params) do
    changeset = DasWebApi.Customer.changeset(params)
    with {:ok, %DasWebApi.Customer{} = customer} <- DasWebApi.Repo.insert(changeset) do
      conn
      |> put_status(:created)
      |> render("201.json", customer: customer)
    end
  end
end
