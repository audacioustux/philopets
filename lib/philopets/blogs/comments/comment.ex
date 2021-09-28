defmodule Philopets.Blogs.Comments.Comment do
  use Philopets.Schema
  import Ecto.Changeset
  alias Philopets.Blogs.Blog
  alias Philopets.Accounts.Profiles.Profile

  schema "blog_comments" do
    field :body, :string

    belongs_to(:replied_to, __MODULE__, foreign_key: :parent_id)
    has_many(:replies, __MODULE__, foreign_key: :parent_id)
    belongs_to(:blog, Blog)
    belongs_to(:profile, Profile)

    timestamps()
  end

  @required_fields ~w[body profile_id blog_id]a
  @optional_fields ~w[parent_id]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
