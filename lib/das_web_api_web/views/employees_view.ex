defmodule DasWebApiWeb.EmployeesView do
  use DasWebApiWeb, :view

  def render("index.json", %{employees: employees}) do
    %{employees: employees}
  end
end
