defmodule PhoenixApp.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employee_id, :string, null: false
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :phone_number, :string
      add :job_title, :string
      add :department, :string
      add :salary, :decimal
      add :hire_date, :date
      add :birth_date, :date
      add :status, :integer

      timestamps()
    end

    # Add a unique index on the employee_id column
    create unique_index(:employees, [:employee_id])
  end
end
