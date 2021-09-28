defmodule Philopets.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      # :citext for case-insensitivity
      add :email, :citext, null: false
      add :is_primary, :boolean, default: false, null: false
      add :is_public, :boolean, default: false, null: false
      # can be used for password recovery. default set to false, as weak
      # security of any one backup email address will make the account associated vulnerable as well
      add :is_backup, :boolean, default: false, null: false
      add :verified_at, :utc_datetime_usec

      add :account_id, references(:accounts, type: :binary_id, on_delete: :delete_all, null: false)

      timestamps()
    end

    # verified emails must be unique
    create unique_index(:emails, :email,
             where: "verified_at IS NOT NULL",
             name: :emails_unique_verified_index
           )

    # disallow multiple unverified per account
    # or-else one may insert the same email address multiple times,
    # accidentally or intentionally
    create unique_index(:emails, :account_id,
             where: "verified_at IS NULL",
             name: :emails_unique_unverified_per_account_index
           )

    # only allow one primary email
    create unique_index(:emails, :account_id,
             where: "is_primary AND verified_at IS NOT NULL",
             name: :emails_unique_primary_per_account_index
           )

    # foreign key index
    create index(:emails, [:account_id])
  end
end
