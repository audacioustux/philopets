defmodule Philopets.Repo.Migrations.CreateBlogComments do
  use Ecto.Migration

  def change do
    create table(:blog_comments) do
      add :body, :text, null: false
      add :blog_id, references(:blogs, on_delete: :delete_all), primary_key: true, null: false
      add :profile_id, references(:profiles, on_delete: :delete_all), null: false
      add :parent_id, references(:blog_comments, with: [blog_id: :blog_id], on_delete: :delete_all)

      timestamps()
    end

    create index(:blog_comments, [:profile_id])
    create index(:blog_comments, [:blog_id])
    create index(:blog_comments, [:parent_id])
  end
end
