defmodule PlotsCreator.Repo do
  use Ecto.Repo,
    otp_app: :plots_creator,
    adapter: Ecto.Adapters.Postgres
end
