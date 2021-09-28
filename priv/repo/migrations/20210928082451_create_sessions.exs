defmodule Philopets.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions, primary_key: false) do
      add(:id, :binary_id,
        primary_key: true,
        default: fragment("gen_random_uuid()")
      )
      add :is_deleted, :boolean, default: false, null: false
      add :account_id, references(:accounts, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:sessions, [:account_id])
  end
end
