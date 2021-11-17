defmodule DasWebApi.Employees.Update do
  alias DasWebApi.Repo
  alias DasWebApi.Employee

  def call(%{"id" => id} = params) do
    with %Employee{} = employee <- Repo.get(Employee, id) do
      employee
      |> Employee.changeset(params)
      |> Repo.update
    end
  end
end
