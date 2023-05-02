defmodule SmsApp.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :street_address, :string
      add :city, :string
      add :state, :string
      add :zipcode, :integer
      add :store_identifier, :integer

      timestamps()
    end
  end
end
