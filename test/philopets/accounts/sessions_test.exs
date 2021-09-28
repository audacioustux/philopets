defmodule Philopets.Accounts.SessionsTest do
  use Philopets.DataCase

  alias Philopets.Accounts.Sessions

  describe "sessions" do
    alias Philopets.Accounts.Sessions.Session
    alias Philopets.AccountsFixtures

    import Philopets.Accounts.SessionsFixtures

    @invalid_attrs %{is_deleted: nil, account_id: nil}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Sessions.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Sessions.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      account = AccountsFixtures.account_fixture()
      valid_attrs = %{is_deleted: true, account_id: account.id}

      assert {:ok, %Session{} = session} = Sessions.create_session(valid_attrs)
      assert session.is_deleted == true
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sessions.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{is_deleted: false}

      assert {:ok, %Session{} = session} = Sessions.update_session(session, update_attrs)
      assert session.is_deleted == false
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Sessions.update_session(session, @invalid_attrs)
      assert session == Sessions.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Sessions.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Sessions.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Sessions.change_session(session)
    end
  end
end
