defmodule DasWebApi.Customers.Delete do
  alias DasWebApi.Customer
  alias DasWebApi.Repo

  def call(params) do
    with %Customer{} = customer <- DasWebApi.Customers.Find.call(params) do
      customer
      |> Repo.delete
    end
  end
end
