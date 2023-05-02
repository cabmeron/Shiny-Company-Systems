defmodule SmsAppWeb.StoreLive.FormComponent do
  use SmsAppWeb, :live_component

  alias SmsApp.Company

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage store records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="store-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:street_address]} type="text" label="Street address" />
        <.input field={@form[:city]} type="text" label="City" />
        <.input field={@form[:state]} type="text" label="State" />
        <.input field={@form[:zipcode]} type="number" label="Zipcode" />
        <.input field={@form[:store_identifier]} type="number" label="Store identifier" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Store</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{store: store} = assigns, socket) do
    changeset = Company.change_store(store)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"store" => store_params}, socket) do
    changeset =
      socket.assigns.store
      |> Company.change_store(store_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"store" => store_params}, socket) do
    save_store(socket, socket.assigns.action, store_params)
  end

  defp save_store(socket, :edit, store_params) do
    case Company.update_store(socket.assigns.store, store_params) do
      {:ok, store} ->
        notify_parent({:saved, store})

        {:noreply,
         socket
         |> put_flash(:info, "Store updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_store(socket, :new, store_params) do
    case Company.create_store(store_params) do
      {:ok, store} ->
        notify_parent({:saved, store})

        {:noreply,
         socket
         |> put_flash(:info, "Store created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
