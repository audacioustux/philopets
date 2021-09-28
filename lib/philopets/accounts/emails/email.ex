defmodule Philopets.Accounts.Emails.Email do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts.Account

  schema "emails" do
    field :email, :string
    field :is_backup, :boolean
    field :is_primary, :boolean
    field :is_public, :boolean
    field :verified_at, :utc_datetime_usec

    belongs_to(:account, Account)

    timestamps()
  end

  @required_fields ~w[email account_id]a
  @optional_fields ~w[is_primary is_public is_backup verified_at]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
