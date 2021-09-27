defmodule Philopets.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add(:display_name, :string, null: false)
      add(:account_id, references(:accounts, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(index(:profiles, [:account_id]))
  end
end
