defmodule DasWebApi do
  @moduledoc """
  DasWebApi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_product(params), to: DasWebApi.Products.Create, as: :call
  defdelegate update_product(params), to: DasWebApi.Products.Update, as: :call
end
