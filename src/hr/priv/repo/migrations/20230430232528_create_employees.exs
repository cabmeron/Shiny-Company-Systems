defmodule Hr.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employee_identifier, :string
      add :last_name, :string
      add :first_name, :string
      add :date_of_hire, :date
      add :department, :string

      timestamps()
    end
  end
end
