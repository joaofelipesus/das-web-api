defmodule DasWebApiWeb.EmployeesView do
  use DasWebApiWeb, :view

  def render("index.json", %{employees: employees}) do
    %{employees: Enum.map(employees, fn e -> render_employee(e) end)}
  end

  def render("employee.json", %{employee: employee}), do: render_employee(employee)

  defp render_employee(employee) do
    %{employee: employee}
  end
end
