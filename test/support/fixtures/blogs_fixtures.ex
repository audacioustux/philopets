defmodule Philopets.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Blogs` context.
  """

  alias Philopets.Accounts.ProfilesFixtures

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{profile_id: ProfilesFixtures.profile_fixture().id}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Philopets.Blogs.create_blog()

    blog
  end
end
