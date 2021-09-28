defmodule Philopets.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        ntag: "0000",
        state: :active,
        username: "some username"
      })
      |> Philopets.Accounts.create_account()

    account
  end
end
