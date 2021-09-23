defmodule Philopets.Accounts.Account do
  use Philopets.Schema
  import Ecto.Changeset

  schema "accounts" do
    field(:hashed_password, :string, redact: true)
    field(:ntag, :string)
    field(:state, Ecto.Enum, values: [:active, :deactive, :deleted, :banned])
    field(:username, :string)

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:username, :ntag, :hashed_password, :state])
    |> validate_required([:username, :ntag, :hashed_password, :state])
  end
end
