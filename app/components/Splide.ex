defmodule HologramSkeleton.Components.Splide do
  use Hologram.Component
  use Hologram.JS

  js_import from: "@splidejs/splide", as: :Splide

  prop :class, :string, default: ""
  prop :label, :string, default: "Splide Basic HTML Example"

  def init(props, component, _server) do
    component
    |> put_action(:init_splide, %{cid: props.cid})
    |> put_state(:label, props.label)
  end

  def template do
    ~HOLO"""
    <div id={"#{@cid}-splide"} class={@class <> " splide"} role="group" aria-label={@label}>
      <div class="splide__track">
        <ul class="splide__list">
          <slot />
        </ul>
      </div>
    </div>
    """
  end

  def action(:init_splide, params, component) do
    id = "##{params.cid}-splide"

    :Splide
    |> JS.new(["#{id}", %{
      type: "loop",
      perPage: 1,
      autoplay: true,
      interval: 2000,
      pauseOnHover: false,
      resetProgress: false
    }])
    |> JS.call(:mount, [])

    component
  end
end
