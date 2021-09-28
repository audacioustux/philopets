defmodule Philopets.Accounts.Sessions.Session do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts.Account

  schema "sessions" do
    field :is_deleted, :boolean

    belongs_to(:account, Account)

    timestamps()
  end

  @required_fields ~w[account_id]a
  @optional_fields ~w[is_deleted]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
