defmodule RegUser.Repo do
  use Ecto.Repo,
    otp_app: :reg_user,
    adapter: Ecto.Adapters.Postgres
end
