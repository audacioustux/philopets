defmodule Philopets.Products.Product do
  use Philopets.Schema
  import Ecto.Changeset

  alias Philopets.Sellers.Seller

  schema "products" do
    field :name, :string
    field :unit_price, :decimal
    field :units_in_stock, :integer

    belongs_to(:seller, Seller)

    timestamps()
  end

  @required_fields ~w[name seller_id]a
  @optional_fields ~w[unit_price units_in_stock]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
