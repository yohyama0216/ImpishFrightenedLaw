defmodule PhoenixApp.Repo.Migrations.CreateCertifications do
  use Ecto.Migration

  def change do
    create table(:certifications) do
      add :title, :string
      add :grade, :integer
      add :status, :integer

      timestamps()
    end
  end
end
