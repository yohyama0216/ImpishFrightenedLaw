defmodule PhoenixApp.Certifications do
  @moduledoc """
  The Certifications context.
  """

  import Ecto.Query, warn: false
  alias PhoenixApp.Repo

  alias PhoenixApp.Certifications.Certification

  @doc """
  Returns the list of certifications.

  ## Examples

      iex> list_certifications()
      [%Certification{}, ...]

  """
  def list_certifications do
    Repo.all(Certification)
  end

  @doc """
  Gets a single certification.

  Raises `Ecto.NoResultsError` if the Certification does not exist.

  ## Examples

      iex> get_certification!(123)
      %Certification{}

      iex> get_certification!(456)
      ** (Ecto.NoResultsError)

  """
  def get_certification!(id), do: Repo.get!(Certification, id)

  @doc """
  Creates a certification.

  ## Examples

      iex> create_certification(%{field: value})
      {:ok, %Certification{}}

      iex> create_certification(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_certification(attrs \\ %{}) do
    %Certification{}
    |> Certification.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a certification.

  ## Examples

      iex> update_certification(certification, %{field: new_value})
      {:ok, %Certification{}}

      iex> update_certification(certification, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_certification(%Certification{} = certification, attrs) do
    certification
    |> Certification.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a certification.

  ## Examples

      iex> delete_certification(certification)
      {:ok, %Certification{}}

      iex> delete_certification(certification)
      {:error, %Ecto.Changeset{}}

  """
  def delete_certification(%Certification{} = certification) do
    Repo.delete(certification)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking certification changes.

  ## Examples

      iex> change_certification(certification)
      %Ecto.Changeset{data: %Certification{}}

  """
  def change_certification(%Certification{} = certification, attrs \\ %{}) do
    Certification.changeset(certification, attrs)
  end
end
