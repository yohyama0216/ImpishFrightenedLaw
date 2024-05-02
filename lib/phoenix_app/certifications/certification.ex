defmodule PhoenixApp.Certifications.Certification do
  use Ecto.Schema
  import Ecto.Changeset

  schema "certifications" do
    field :acquired_date, :date
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(certification, attrs) do
    certification
    |> cast(attrs, [:name, :description, :acquired_date])
    |> validate_required([:name, :description, :acquired_date])
  end
end
