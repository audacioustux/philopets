defmodule Philopets.Blogs.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Blogs.Comments` context.
  """
  alias Philopets.BlogsFixtures
  alias Philopets.Accounts.ProfilesFixtures

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{profile_id: ProfilesFixtures.profile_fixture().id}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        blog_id: BlogsFixtures.blog_fixture(%{profile_id: attrs[:profile_id]}).id
      })
      |> Philopets.Blogs.Comments.create_comment()

    comment
  end
end
