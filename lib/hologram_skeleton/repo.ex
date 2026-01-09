defmodule HologramSkeleton.Repo do
  use Ecto.Repo,
    otp_app: :hologram_accordion,
    adapter: Ecto.Adapters.Postgres
end
