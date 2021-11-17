defmodule DasWebApi do
  @moduledoc """
  DasWebApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_product(params), to: DasWebApi.Products.Create, as: :call
  defdelegate update_product(params), to: DasWebApi.Products.Update, as: :call
  defdelegate delete_product(params), to: DasWebApi.Products.Delete, as: :call

  defdelegate create_customer(params), to: DasWebApi.Customers.Create, as: :call
  defdelegate find_customer(id), to: DasWebApi.Customers.Find, as: :call
  defdelegate update_customer(params), to: DasWebApi.Customers.Update, as: :call
  defdelegate delete_customer(params), to: DasWebApi.Customers.Delete, as: :call

  defdelegate create_employee(params), to: DasWebApi.Employees.Create, as: :call
end
