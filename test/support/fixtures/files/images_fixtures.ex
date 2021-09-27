defmodule Philopets.Files.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Philopets.Files.Images` context.
  """
  alias Philopets.Accounts.ProfilesFixtures

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        name: "some name",
        size: 42,
        profile_id: ProfilesFixtures.profile_fixture().id
      })
      |> Philopets.Files.Images.create_image()

    image
  end
end
