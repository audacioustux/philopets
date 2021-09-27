defmodule Philopets.Repo.Migrations.ProfilesAddDisplayPic do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      # dp/DisplayPic
      add(:dp_id, references(:images, type: :binary_id, on_delete: :nilify_all))
    end
  end
end
