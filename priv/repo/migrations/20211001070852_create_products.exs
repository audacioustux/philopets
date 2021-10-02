defmodule Philopets.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      # assume null == unlimited
      add :units_in_stock, :integer
      # price must be negotiated if null
      add :unit_price, :decimal
      add :seller_id, references(:sellers, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:products, [:units_in_stock])
    create index(:products, [:seller_id])
    create index(:products, [:unit_price])
  end
end
