defmodule Philopets.Accounts.Profiles.Profile do
  use Philopets.Schema
  import Ecto.Changeset
  alias Philopets.Accounts.Account
  alias Philopets.Files.Images.Image

  schema "profiles" do
    field(:display_name, :string)

    belongs_to(:account, Account)
    has_many(:images, Image)

    timestamps()
  end

  @required_fields ~w[display_name account_id]a
  @optional_fields ~w[]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
