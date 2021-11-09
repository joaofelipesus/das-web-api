defmodule DasWebApiWeb.FallbackController do
  use DasWebApiWeb, :controller

  alias DasWebApiWeb.ErrorView

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", %{result: result})
  end

  def call(conn, nil) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render("404.json", %{resource: resource(conn)})
  end

  defp resource(%Plug.Conn{request_path: request_path}) do
    request_path
    |> String.split("/")
    |> Enum.at(2)
    |> String.capitalize
    |> String.slice(0..-2)
  end
end
