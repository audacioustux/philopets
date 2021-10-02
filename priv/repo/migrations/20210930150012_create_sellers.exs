defmodule Philopets.Repo.Migrations.CreateSellers do
  use Ecto.Migration

  def change do
    create table(:sellers) do
      add :name, :string
      add :display_pic, references(:images, on_delete: :nilify_all)

      timestamps()
    end

  end
end
