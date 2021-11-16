defmodule DasWebApi.Customers.Find do
  alias DasWebApi.Repo
  alias DasWebApi.Customer

  def call(id) do
    customer = Repo.get(Customer, id)
    case customer do
      nil -> {:error, "Not found"}
      %Customer{} -> customer
    end
  end
end
