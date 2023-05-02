defmodule Hr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HrWeb.Telemetry,
      # Start the Ecto repository
      Hr.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hr.PubSub},
      # Start Finch
      {Finch, name: Hr.Finch},
      # Start the Endpoint (http/https)
      HrWeb.Endpoint
      # Start a worker by calling: Hr.Worker.start_link(arg)
      # {Hr.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
