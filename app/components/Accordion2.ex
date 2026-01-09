defmodule HologramSkeleton.Components.Accordion2 do
  use Hologram.Component

  prop :title, :string, default: ""
  prop :collapsed, :boolean, default: false
  prop :class, :string, default: "border border-gray-200 rounded-lg"

  prop :button_class, :string,
    default:
      "flex w-full items-center justify-between gap-x-4 p-4 text-left bg-neutral/10 hover:bg-neutral/20 rounded-t cursor-pointer"

  prop :title_class, :string, default: "text-lg font-medium text-gray-800"
  prop :content_class, :string, default: "p-4"
  prop :parent_cid, :string, default: "page"

  def init(props, component, _server) do
    component
    |> put_state(:collapsed, props.collapsed)
    |> put_state(:parent_cid, props.parent_cid)
  end

  def template do
    ~HOLO"""
    <div class={@class}>
      <div id={"accordion-#{@cid}"} class="group {if @collapsed do "closed" else "open" end}">
        <button
          class={@button_class}
          aria-controls={"accordion-#{@cid}-collapse"}
          aria-expanded={@collapsed}
          $click={:toggle}>
            <h2 class={@title_class}>
              {@title}
            </h2>
            <span class="-rotate-90 group-[.open]:rotate-0 transition-transform duration-300">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="square" stroke-width="2" d="M17.5 9.5L12 15L6.5 9.5"/></svg>
            </span>
        </button>
        <div id={"accordion-#{@cid}-collapse"} class="w-full overflow-hidden transition-all duration-300 max-h-0 group-[.open]:max-h-none" aria-labelledby={"optiongroup-#{@cid}"} role="region">
          <div class={@content_class}>
            <slot />
          </div>
        </div>
      </div>
    </div>
    """
  end

  def action(:toggle, _params, component) do
    new_collapsed = !component.state.collapsed

    component
    |> put_state(:collapsed, new_collapsed)
  end


  def action(action, params, component) do
    target = component.state.parent_cid

    put_action(component, name: action, target: target, params: params)
  end

end
