defmodule Philopets.Blogs.Blog do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Accounts.Profiles.Profile

  schema "blogs" do
    field :body, :string
    field :title, :string
    belongs_to(:profile, Profile)

    timestamps()
  end

  @required_fields ~w[title body profile_id]a
  @optional_fields ~w[]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
