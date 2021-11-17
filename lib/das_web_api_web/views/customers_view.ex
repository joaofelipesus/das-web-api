defmodule DasWebApiWeb.CustomersView do
  use DasWebApiWeb, :view

  def render("customer.json", %{customer: customer}) do
    %{customer: customer}
  end

  def render("index.json", %{customers: customers}) do
    %{ customers: customers }
  end
end
