defmodule DasWebApiWeb.Plugs.UUIDHandler do
  import Plug.Conn

  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{params: %{"id" => id}} = conn, _options) do
    case Ecto.UUID.cast(id) do
      :error -> handle_error(conn)
      {:ok, _} -> conn
    end
  end

  def call(conn, _opts), do: conn

  defp handle_error(conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, %{message: "UUID bad format."})
    |> halt
  end
end
