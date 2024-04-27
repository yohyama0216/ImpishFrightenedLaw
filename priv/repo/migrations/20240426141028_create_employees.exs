defmodule PhoenixApp.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :job, :string
      add :age, :integer
      add :birth_pref, :string
      timestamps()
    end
  end
end
