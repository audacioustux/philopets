defmodule Philopets.SellersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Sellers` context.
  """

  @doc """
  Generate a seller.
  """
  def seller_fixture(attrs \\ %{}) do
    {:ok, seller} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Philopets.Sellers.create_seller()

    seller
  end
end
