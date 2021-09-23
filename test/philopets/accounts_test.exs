defmodule Philopets.AccountsTest do
  use Philopets.DataCase

  alias Philopets.Accounts

  describe "accounts" do
    alias Philopets.Accounts.Account

    import Philopets.AccountsFixtures

    @invalid_attrs %{hashed_password: nil, ntag: nil, state: nil, username: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{
        hashed_password: "some hashed_password",
        ntag: "0000",
        state: :active,
        username: "some username"
      }

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.hashed_password == "some hashed_password"
      assert account.ntag == "0000"
      assert account.state == :active
      assert account.username == "some username"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()

      update_attrs = %{
        hashed_password: "some updated hashed_password",
        ntag: "1111",
        state: :deactive,
        username: "some updated username"
      }

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.hashed_password == "some updated hashed_password"
      assert account.ntag == "1111"
      assert account.state == :deactive
      assert account.username == "some updated username"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
