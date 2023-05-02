defmodule SmsApp.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SmsApp.Company` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        city: "some city",
        state: "some state",
        store_identifier: 42,
        street_address: "some street_address",
        zipcode: 42
      })
      |> SmsApp.Company.create_store()

    store
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        current_inventory_count: 42,
        product_name: "some product_name",
        retail_price: 120.5,
        vendor_name: "some vendor_name",
        wholesale_price: 120.5
      })
      |> SmsApp.Company.create_product()

    product
  end
end
