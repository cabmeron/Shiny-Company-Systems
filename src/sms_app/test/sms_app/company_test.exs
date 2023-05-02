defmodule SmsApp.CompanyTest do
  use SmsApp.DataCase

  alias SmsApp.Company

  describe "stores" do
    alias SmsApp.Company.Store

    import SmsApp.CompanyFixtures

    @invalid_attrs %{city: nil, state: nil, store_identifier: nil, street_address: nil, zipcode: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Company.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Company.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{city: "some city", state: "some state", store_identifier: 42, street_address: "some street_address", zipcode: 42}

      assert {:ok, %Store{} = store} = Company.create_store(valid_attrs)
      assert store.city == "some city"
      assert store.state == "some state"
      assert store.store_identifier == 42
      assert store.street_address == "some street_address"
      assert store.zipcode == 42
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{city: "some updated city", state: "some updated state", store_identifier: 43, street_address: "some updated street_address", zipcode: 43}

      assert {:ok, %Store{} = store} = Company.update_store(store, update_attrs)
      assert store.city == "some updated city"
      assert store.state == "some updated state"
      assert store.store_identifier == 43
      assert store.street_address == "some updated street_address"
      assert store.zipcode == 43
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_store(store, @invalid_attrs)
      assert store == Company.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Company.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Company.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Company.change_store(store)
    end
  end

  describe "products" do
    alias SmsApp.Company.Product

    import SmsApp.CompanyFixtures

    @invalid_attrs %{current_inventory_count: nil, product_name: nil, retail_price: nil, vendor_name: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Company.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Company.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{current_inventory_count: 42, product_name: "some product_name", retail_price: 120.5, vendor_name: "some vendor_name", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = Company.create_product(valid_attrs)
      assert product.current_inventory_count == 42
      assert product.product_name == "some product_name"
      assert product.retail_price == 120.5
      assert product.vendor_name == "some vendor_name"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{current_inventory_count: 43, product_name: "some updated product_name", retail_price: 456.7, vendor_name: "some updated vendor_name", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = Company.update_product(product, update_attrs)
      assert product.current_inventory_count == 43
      assert product.product_name == "some updated product_name"
      assert product.retail_price == 456.7
      assert product.vendor_name == "some updated vendor_name"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_product(product, @invalid_attrs)
      assert product == Company.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Company.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Company.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Company.change_product(product)
    end
  end
end
