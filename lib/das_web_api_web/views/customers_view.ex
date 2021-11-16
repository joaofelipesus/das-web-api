defmodule DasWebApiWeb.CustomersView do
  use DasWebApiWeb, :view

  def render("201.json", %{customer: customer}) do
    %{customer: customer}
  end
end
