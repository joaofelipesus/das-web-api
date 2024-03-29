defmodule DasWebApiWeb.EmployeesController do
  use DasWebApiWeb, :controller

  alias DasWebApi.Employee
  alias DasWebApi.Repo

  action_fallback DasWebApiWeb.FallbackController

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> render("index.json", employees: Repo.all(Employee))
  end

  def show(conn, %{"id" => id}) do
    with %Employee{} = employee <- Repo.get(Employee, id) do
      conn
      |> put_status(:ok)
      |> render("show.json", employee: employee)
    end
  end

  def create(conn, params) do
    with {:ok, %Employee{} = employee} <- DasWebApi.create_employee(params) do
      conn
      |> put_status(:created)
      |> render("show.json", employee: employee)
    end
  end

  def update(conn, params) do
    with {:ok, %Employee{} = employee} <- DasWebApi.update_employee(params) do
      conn
      |> put_status(:ok)
      |> render("show.json", employee: employee)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _} <- DasWebApi.delete_employee(id) do
      conn
      |> text("")
      |> put_status(:no_content)
    end
  end
end
