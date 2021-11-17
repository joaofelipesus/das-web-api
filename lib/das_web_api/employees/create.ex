defmodule DasWebApi.Employees.Create do
  alias DasWebApi.Employee
  alias DasWebApi.Repo

  def call(params) do
    params
    |> Employee.changeset
    |> Repo.insert
  end
end
