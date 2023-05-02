defmodule Hr.Hr_sys.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :date_of_hire, :date
    field :department, :string
    field :employee_identifier, :string
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:employee_identifier, :last_name, :first_name, :date_of_hire, :department])
    |> validate_required([:employee_identifier, :last_name, :first_name, :date_of_hire, :department])
  end
end
