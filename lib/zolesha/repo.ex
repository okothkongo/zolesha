defmodule Zolesha.Repo do
  use Ecto.Repo,
    otp_app: :zolesha,
    adapter: Ecto.Adapters.Postgres
end
