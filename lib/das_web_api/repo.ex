defmodule DasWebApi.Repo do
  use Ecto.Repo,
    otp_app: :das_web_api,
    adapter: Ecto.Adapters.Postgres
end
