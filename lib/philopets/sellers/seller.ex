defmodule Philopets.Sellers.Seller do
  use Philopets.Schema
  import Ecto.Changeset

  schema "sellers" do
    field :name, :string
    field :display_pic, :id

    timestamps()
  end

  @required_fields ~w[name]a
  @optional_fields ~w[display_pic]a

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
