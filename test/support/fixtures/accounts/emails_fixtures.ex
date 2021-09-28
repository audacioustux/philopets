defmodule Philopets.Accounts.EmailsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Accounts.Emails` context.
  """

  alias Philopets.AccountsFixtures

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        email: "abc@ijk.xyz",
        is_backup: true,
        is_primary: true,
        is_public: true,
        verified_at: ~U[2021-09-27 07:31:00.000000Z],
        account_id: AccountsFixtures.account_fixture().id
      })
      |> Philopets.Accounts.Emails.create_email()

    email
  end
end
