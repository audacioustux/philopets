defmodule Philopets.Repo.Migrations.ProfilesAddDisplayPic do
  use Ecto.Migration

  def change do
    alter table(:profiles) do
      add(:display_pic, references(:images, type: :binary_id, on_delete: :nilify_all))
    end
  end
end
