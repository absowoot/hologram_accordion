defmodule HologramSkeleton.HomePage do
  use Hologram.Page

  route "/"

  layout HologramSkeleton.DefaultLayout

  def init(_params, component, _server) do
    component
    |> put_state(:name, nil)
  end

  def template do
    ~HOLO"""
    <div class="max-w-3xl mx-auto p-4 space-y-6">
      <h1 class="text-3xl font-bold">Welcome to Hologram Skeleton!</h1>
      {%if @name}
        <p>Your name is: {@name}</p>
        <button
          class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700"
          $click="clear_name">
          Clear Name
        </button>
      {/if}

      <HologramSkeleton.Components.Accordion cid="no-target" title="Accordion Example 1">
        <p>This is an example of an accordion component without event passing. Submit the form and check the console.</p>
        <form $submit="form_submitted" class="space-y-4">
          <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" name="name" id="name" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2" />
          </div>
          <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">Submit</button>
        </form>
      </HologramSkeleton.Components.Accordion>

      <HologramSkeleton.Components.Accordion cid="with-target" title="Accordion Example 2">
        <p>This is an example of an accordion component with event passing.</p>
        <form $submit={action: :form_submitted, target: "page"} class="space-y-4">
          <div>
            <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
            <input type="text" name="name" id="name" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2" />
          </div>
          <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">Submit</button>
        </form>
      </HologramSkeleton.Components.Accordion>

      <HologramSkeleton.Components.Block cid="block-with-nested-accordion">
        <p>This is content inside a Block component.</p>
      </HologramSkeleton.Components.Block>
    </div>
    """
  end

  def action(:form_submitted, %{event: %{"name" => name}}, component) do
    put_state(component, :name, name)
  end

  def action(:clear_name, _params, component) do
    put_state(component, :name, nil)
  end
end
