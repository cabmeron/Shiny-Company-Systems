defmodule SmsAppWeb.StoreLiveTest do
  use SmsAppWeb.ConnCase

  import Phoenix.LiveViewTest
  import SmsApp.CompanyFixtures

  @create_attrs %{city: "some city", state: "some state", store_identifier: 42, street_address: "some street_address", zipcode: 42}
  @update_attrs %{city: "some updated city", state: "some updated state", store_identifier: 43, street_address: "some updated street_address", zipcode: 43}
  @invalid_attrs %{city: nil, state: nil, store_identifier: nil, street_address: nil, zipcode: nil}

  defp create_store(_) do
    store = store_fixture()
    %{store: store}
  end

  describe "Index" do
    setup [:create_store]

    test "lists all stores", %{conn: conn, store: store} do
      {:ok, _index_live, html} = live(conn, ~p"/stores")

      assert html =~ "Listing Stores"
      assert html =~ store.city
    end

    test "saves new store", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/stores")

      assert index_live |> element("a", "New Store") |> render_click() =~
               "New Store"

      assert_patch(index_live, ~p"/stores/new")

      assert index_live
             |> form("#store-form", store: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#store-form", store: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stores")

      html = render(index_live)
      assert html =~ "Store created successfully"
      assert html =~ "some city"
    end

    test "updates store in listing", %{conn: conn, store: store} do
      {:ok, index_live, _html} = live(conn, ~p"/stores")

      assert index_live |> element("#stores-#{store.id} a", "Edit") |> render_click() =~
               "Edit Store"

      assert_patch(index_live, ~p"/stores/#{store}/edit")

      assert index_live
             |> form("#store-form", store: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#store-form", store: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/stores")

      html = render(index_live)
      assert html =~ "Store updated successfully"
      assert html =~ "some updated city"
    end

    test "deletes store in listing", %{conn: conn, store: store} do
      {:ok, index_live, _html} = live(conn, ~p"/stores")

      assert index_live |> element("#stores-#{store.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#stores-#{store.id}")
    end
  end

  describe "Show" do
    setup [:create_store]

    test "displays store", %{conn: conn, store: store} do
      {:ok, _show_live, html} = live(conn, ~p"/stores/#{store}")

      assert html =~ "Show Store"
      assert html =~ store.city
    end

    test "updates store within modal", %{conn: conn, store: store} do
      {:ok, show_live, _html} = live(conn, ~p"/stores/#{store}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Store"

      assert_patch(show_live, ~p"/stores/#{store}/show/edit")

      assert show_live
             |> form("#store-form", store: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#store-form", store: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/stores/#{store}")

      html = render(show_live)
      assert html =~ "Store updated successfully"
      assert html =~ "some updated city"
    end
  end
end
