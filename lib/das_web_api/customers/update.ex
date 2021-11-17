defmodule DasWebApi.Customers.Update do
  alias DasWebApi.Customer
  alias DasWebApi.Repo
  alias DasWebApi.Customers.Find

  def call(%{ "id" => id } = params) do
    customer = Find.call(id)
    case customer do
      {:error, error} -> error
      %Customer{} ->
        customer
        |> Customer.changeset(params)
        |> Repo.update
    end
  end
end
