defmodule Philopets.Accounts.Account do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts
  alias Accounts.{Profiles.Profile, Emails.Email, Sessions.Session}

  schema "accounts" do
    field(:password, :string, virtual: true, redact: true)
    field(:hashed_password, :string, redact: true)
    field(:ntag, :string)
    field(:state, Ecto.Enum, values: [:active, :deactive, :deleted, :banned])
    field(:username, :string)

    has_many(:profiles, Profile)
    has_many(:emails, Email)
    has_many(:sessions, Session)

    timestamps()
  end

  @required_fields ~w[username ntag]a
  @optional_fields ~w[state password]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
