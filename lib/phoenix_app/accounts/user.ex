defmodule PhoenixApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :job, :string
    field :age, :integer
    field :birth_pref, :string
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
