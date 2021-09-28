defmodule Philopets.Blogs.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_comments" do
    field :body, :string
    field :profile_id, :id
    field :blog_id, :id
    field :replied_to, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
