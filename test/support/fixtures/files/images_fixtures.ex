defmodule Philopets.Files.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Files.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        name: "some name",
        size: 42
      })
      |> Philopets.Files.Images.create_image()

    image
  end
end
