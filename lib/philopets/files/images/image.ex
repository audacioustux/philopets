defmodule Philopets.Files.Images.Image do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts.Profile

  schema "images" do
    field(:name, :string)
    field(:size, :integer)

    belongs_to(:profile, Profile)

    timestamps()
  end

  @required_fields ~w[name size profile_id]a
  @optional_fields ~w[]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
