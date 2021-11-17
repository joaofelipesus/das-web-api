defmodule DasWebApi.Employees.Delete do
  alias DasWebApi.Repo
  alias DasWebApi.Employee

  def call(id) do
    with %Employee{} = employee <- Repo.get(Employee, id) do
      Repo.delete(employee)
    end
  end
end
