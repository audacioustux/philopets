defmodule Philopets.Blogs.CommentsTest do
  use Philopets.DataCase

  alias Philopets.Blogs.Comments

  describe "blog_comments" do
    alias Philopets.Blogs.Comments.Comment
    alias Philopets.BlogsFixtures
    alias Philopets.Accounts.ProfilesFixtures

    import Philopets.Blogs.CommentsFixtures

    @invalid_attrs %{body: nil, blog_id: nil}

    test "list_blog_comments/0 returns all blog_comments" do
      comment = comment_fixture()
      assert Comments.list_blog_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Comments.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      profile = ProfilesFixtures.profile_fixture()
      blog = BlogsFixtures.blog_fixture(%{profile_id: profile.id})
      valid_attrs = %{body: "some body", blog_id: blog.id, profile_id: profile.id}

      assert {:ok, %Comment{} = comment} = Comments.create_comment(valid_attrs)
      assert comment.body == "some body"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Comment{} = comment} = Comments.update_comment(comment, update_attrs)
      assert comment.body == "some updated body"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Comments.update_comment(comment, @invalid_attrs)
      assert comment == Comments.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Comments.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Comments.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Comments.change_comment(comment)
    end
  end
end
