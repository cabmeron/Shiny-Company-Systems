defmodule SmsApp.Company.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field(:current_inventory_count, :integer)
    field(:product_name, :string)
    field(:retail_price, :float)
    field(:vendor_name, :string)
    field(:wholesale_price, :float)
    # field(:product_id, :id)
    belongs_to(:store, SmsApp.Company.Store)

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :product_name,
      :vendor_name,
      :wholesale_price,
      :retail_price,
      :current_inventory_count,
      :store_id
    ])
    |> validate_required([
      :product_name,
      :vendor_name,
      :wholesale_price,
      :retail_price,
      :current_inventory_count,
      :store_id
    ])
  end
end
