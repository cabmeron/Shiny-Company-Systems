defmodule SmsApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add(:product_name, :string)
      add(:vendor_name, :string)
      add(:wholesale_price, :float)
      add(:retail_price, :float)
      add(:current_inventory_count, :integer)
      add(:store_id, references(:stores, on_delete: :nothing))

      timestamps()
    end

    create(index(:products, [:store_id]))
  end
end
