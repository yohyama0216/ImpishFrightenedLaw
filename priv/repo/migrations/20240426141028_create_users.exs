defmodule PhoenixApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :job, :string
      add :age, :integer
      add :birth_pref, :string
      timestamps()
    end
  end
end
