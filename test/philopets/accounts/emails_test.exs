defmodule Philopets.Accounts.EmailsTest do
  use Philopets.DataCase

  alias Philopets.Accounts.Emails

  describe "emails" do
    alias Philopets.Accounts.Emails.Email
    alias Philopets.AccountsFixtures

    import Philopets.Accounts.EmailsFixtures

    @invalid_attrs %{
      email: nil,
      is_backup: nil,
      is_primary: nil,
      is_public: nil,
      verified_at: nil,
      account_id: nil
    }

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Emails.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Emails.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      account = AccountsFixtures.account_fixture()

      valid_attrs = %{
        email: "abc@ijk.xyz",
        is_backup: true,
        is_primary: true,
        is_public: true,
        verified_at: ~U[2021-09-27 07:31:00.000000Z],
        account_id: account.id
      }

      assert {:ok, %Email{} = email} = Emails.create_email(valid_attrs)
      assert email.email == "abc@ijk.xyz"
      assert email.is_backup == true
      assert email.is_primary == true
      assert email.is_public == true
      assert email.verified_at == ~U[2021-09-27 07:31:00.000000Z]
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Emails.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()

      update_attrs = %{
        email: "some updated email",
        is_backup: false,
        is_primary: false,
        is_public: false,
        verified_at: ~U[2021-09-28 07:31:00.000000Z]
      }

      assert {:ok, %Email{} = email} = Emails.update_email(email, update_attrs)
      assert email.email == "some updated email"
      assert email.is_backup == false
      assert email.is_primary == false
      assert email.is_public == false
      assert email.verified_at == ~U[2021-09-28 07:31:00.000000Z]
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Emails.update_email(email, @invalid_attrs)
      assert email == Emails.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Emails.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Emails.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Emails.change_email(email)
    end
  end
end
