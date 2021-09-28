defmodule Philopets.Repo.Migrations.CreateBlogComments do
  use Ecto.Migration

  def change do
    create table(:blog_comments) do
      add :body, :text
      add :profile_id, references(:profiles, on_delete: :nothing)
      add :blog_id, references(:blogs, on_delete: :nothing)
      add :replied_to, references(:comments, on_delete: :nothing)

      timestamps()
    end

    create index(:blog_comments, [:profile_id])
    create index(:blog_comments, [:blog_id])
    create index(:blog_comments, [:replied_to])
  end
end
