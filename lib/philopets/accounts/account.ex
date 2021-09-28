defmodule Philopets.Accounts.Account do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts
  alias Accounts.{Profiles.Profile, Emails.Email, Sessions.Session}

  schema "accounts" do
    field(:hashed_password, :string, redact: true)
    field(:ntag, :string)
    field(:state, Ecto.Enum, values: [:active, :deactive, :deleted, :banned])
    field(:username, :string)

    has_many(:profiles, Profile)
    has_many(:emails, Email)
    has_many(:sessions, Session)

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:username, :ntag, :hashed_password, :state])
    |> validate_required([:username, :ntag, :hashed_password, :state])
  end
end
