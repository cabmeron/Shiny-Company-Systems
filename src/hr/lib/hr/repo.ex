defmodule Hr.Repo do
  use Ecto.Repo,
    otp_app: :hr,
    adapter: Ecto.Adapters.Postgres
end
