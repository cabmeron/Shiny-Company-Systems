defmodule SmsAppWeb.StoreLive.Show do
  use SmsAppWeb, :live_view

  alias SmsApp.Company

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:store, Company.get_store!(id))}
  end

  defp page_title(:show), do: "Show Store"
  defp page_title(:edit), do: "Edit Store"
end
