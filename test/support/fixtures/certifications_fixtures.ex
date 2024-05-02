defmodule PhoenixApp.CertificationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixApp.Certifications` context.
  """

  @doc """
  Generate a certification.
  """
  def certification_fixture(attrs \\ %{}) do
    {:ok, certification} =
      attrs
      |> Enum.into(%{
        acquired_date: ~D[2024-04-29],
        description: "some description",
        name: "some name"
      })
      |> PhoenixApp.Certifications.create_certification()

    certification
  end
end
