defmodule SmsAppWeb.EmployeeLive.Index do
  use SmsAppWeb, :live_view

  alias SmsApp.HumanResources

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :employees, HumanResources.list_employees())}
  end
end
