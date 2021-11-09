defmodule DasWebApiWeb.FallbackController do
  use DasWebApiWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(DasWebApiWeb.ErrorView)
    |> render("error.json", %{result: result})
  end
end
