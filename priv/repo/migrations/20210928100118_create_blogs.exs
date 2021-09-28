defmodule Philopets.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :body, :string
      add :profile_id, references(:profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:blogs, [:profile_id])
  end
end
