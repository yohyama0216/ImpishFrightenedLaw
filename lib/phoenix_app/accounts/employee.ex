defmodule PhoenixApp.Accounts.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :name, :string
    field :job, :string
    field :age, :integer
    field :birth_pref, :string
    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
