defmodule Philopets.Repo do
  use Ecto.Repo,
    otp_app: :philopets,
    adapter: Ecto.Adapters.Postgres
end
