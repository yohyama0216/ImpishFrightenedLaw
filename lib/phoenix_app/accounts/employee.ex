defmodule PhoenixApp.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :employee_id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :phone_number, :string
    field :job_title, :string
    field :department, :string
    field :salary, :decimal
    field :hire_date, :date
    field :birth_date, :date
    field :status, :string
    
    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
