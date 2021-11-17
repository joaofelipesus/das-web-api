defmodule DasWebApiWeb.EmployeesController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Employee
  alias DasWebApi.Repo

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", employees: Repo.all(Employee))
  end
end
