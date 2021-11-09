defmodule DasWebApi.Products.Create do

  alias DasWebApi.Product
  alias DasWebApi.Repo

  def call(params) do
    params
    |> Product.changeset
    |> Repo.insert
  end
end
