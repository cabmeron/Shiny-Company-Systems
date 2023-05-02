defmodule SmsApp.Repo do
  use Ecto.Repo,
    otp_app: :sms_app,
    adapter: Ecto.Adapters.Postgres
end
