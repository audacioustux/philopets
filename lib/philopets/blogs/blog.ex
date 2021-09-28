defmodule Philopets.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :body, :string
    field :title, :string
    field :profile_id, :id

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
