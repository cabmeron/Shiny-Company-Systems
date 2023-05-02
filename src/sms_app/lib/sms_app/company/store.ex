defmodule SmsApp.Company.Store do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field(:city, :string)
    field(:state, :string)
    field(:store_identifier, :integer)
    field(:street_address, :string)
    field(:zipcode, :integer)
    has_many(:products, SmsApp.Company.Product)

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:street_address, :city, :state, :zipcode, :store_identifier])
    |> validate_required([:street_address, :city, :state, :zipcode, :store_identifier])
  end
end
