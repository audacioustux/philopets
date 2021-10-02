defmodule Philopets.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Products` context.
  """

  alias Philopets.SellersFixtures

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{seller_id: SellersFixtures.seller_fixture().id}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        unit_price: "120.5",
        units_in_stock: 42
      })
      |> Philopets.Products.create_product()

    product
  end
end
