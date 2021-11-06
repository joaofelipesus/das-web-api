defmodule DasWebApiWeb.PageController do
  use DasWebApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
