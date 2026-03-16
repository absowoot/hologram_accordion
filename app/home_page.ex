defmodule HologramSkeleton.HomePage do
  use Hologram.Page

  route "/"

  alias Hologram.UI.Link
  alias HologramSkeleton.Components.Splide

  layout HologramSkeleton.DefaultLayout

  def template do
    ~HOLO"""
    <div class="max-w-5xl mx-auto my-6">
      <Link to={HologramSkeleton.HomePage} class="p-4 bg-red-300">Home Page</Link>
    </div>

    <div class="max-w-5xl mx-auto h-16">
      <Splide cid="home-splide" label="Test Splide">
        <li class="splide__slide"><img src="https://placehold.co/600x400" alt="" /></li>
        <li class="splide__slide"><img src="https://placehold.co/600x400" alt="" /></li>
        <li class="splide__slide"><img src="https://placehold.co/600x400" alt="" /></li>
      </Splide>
    </div>
    """
  end
end
