defmodule Philopets.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add(:name, :string, null: false)
      add(:size, :integer, null: false)
      add(:profile, references(:profiles, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(index(:images, [:profile]))
  end
end
