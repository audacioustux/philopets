defmodule Philopets.Accounts.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Accounts.Profiles` context.
  """

  alias Philopets.AccountsFixtures

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        display_name: "some display_name",
        account_id: AccountsFixtures.account_fixture().id
      })
      |> Philopets.Accounts.Profiles.create_profile()

    profile
  end
end
