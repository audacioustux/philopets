defmodule Philopets.Accounts.Profiles.Profile do
  use Philopets.Schema
  import Ecto.Changeset
  alias Philopets.Accounts.Account

  schema "profiles" do
    field(:display_name, :string)
    belongs_to(:account, Account, type: :binary_id)

    timestamps()
  end

  @required_fields ~w[display_name]a
  @optional_fields ~w[]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> put_assoc(:account, required: true)
    |> validate_required(@required_fields)
  end
end
