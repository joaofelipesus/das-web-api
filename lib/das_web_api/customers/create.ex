defmodule DasWebApi.Customers.Create do
  def call(params) do
    params
    |> DasWebApi.Customer.changeset
    |> DasWebApi.Repo.insert
  end
end
