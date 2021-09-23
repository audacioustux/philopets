defmodule Philopets.Files.Images.Image do
  use Philopets.Schema
  import Ecto.Changeset

  schema "images" do
    field(:name, :string)
    field(:size, :integer)
    field(:account, :id)

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :size])
    |> validate_required([:name, :size])
  end
end
