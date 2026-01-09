defmodule HologramSkeleton.Components.Block do
  use Hologram.Component

  def init(_props, component, _server) do
    component
    |> put_state(:age, nil)
  end

  def template do
    ~HOLO"""
    <div class="p-4 border border-gray-300 rounded-md shadow-sm">
      <slot />

      {%if @age}
        <p>Your age is: {@age}</p>
        <button
          class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700"
          $click="clear_age">
          Clear Age
        </button>
      {/if}

      <HologramSkeleton.Components.Accordion cid="nested" title="Accordion Example 3">
        <form $submit={action: :form_submitted, target: @cid} class="space-y-4">
          <div>
            <label for="age" class="block text-sm font-medium text-gray-700">Age</label>
            <input type="text" name="age" id="age" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2" />
          </div>
          <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">Submit</button>
        </form>
      </HologramSkeleton.Components.Accordion>
    </div>
    """
  end

  def action(:form_submitted, %{event: %{"age" => age}}, component) do
    put_state(component, :age, age)
  end

  def action(:clear_age, _params, component) do
    put_state(component, :age, nil)
  end
end
