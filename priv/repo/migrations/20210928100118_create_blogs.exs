defmodule Philopets.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string, null: false
      add :body, :string, null: false
      add :profile_id, references(:profiles, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:blogs, [:profile_id])
  end
end
