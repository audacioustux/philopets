defmodule Philopets.Accounts.SessionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Accounts.Sessions` context.
  """

  alias Philopets.AccountsFixtures

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        is_deleted: true,
        account_id: AccountsFixtures.account_fixture().id
      })
      |> Philopets.Accounts.Sessions.create_session()

    session
  end
end
