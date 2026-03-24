defmodule HologramSkeleton.Page4 do
  use Hologram.Page

  route "/page-4"

  layout HologramSkeleton.DefaultLayout

  def template do
    ~HOLO"""
    <h1>No Ash-related functions</h1>
    """
  end
end
