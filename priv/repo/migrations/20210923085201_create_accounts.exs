defmodule Philopets.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:username, :string, size: 24, null: false)
      # two things we gain by this (not just because discord do this)
      # 1. a lil bit harder to do bruteforce attack
      # 2. usernames are less easy to acquire
      add(:ntag, :string, size: 4, null: false)
      # in-case signed up with 3rd-party accounts, or is a supervised account,
      # password may-be null
      add(:hashed_password, :string)
      add(:state, :string, null: false)

      timestamps()
    end

    create(unique_index(:accounts, [:username, :ntag], name: :accounts_unique_handle_index))
    create(index(:accounts, [:state]))
  end
end
