defmodule Philopets.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images, primary_key: false) do
      # files are typically directly accessible if the name is known. 
      # uuid v1mc is far less random than v4 
      add(:id, :binary_id,
        primary_key: true,
        default: fragment("gen_random_uuid()")
      )
      add(:name, :string, null: false)
      add(:size, :integer, null: false)
      add(:profile_id, references(:profiles, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(index(:images, [:profile_id]))
  end
end
