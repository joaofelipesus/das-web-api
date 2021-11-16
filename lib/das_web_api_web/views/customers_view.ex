defmodule DasWebApiWeb.CustomersView do
  use DasWebApiWeb, :view

  def render("customer.json", %{customer: customer}) do
    %{customer: customer}
  end
end
