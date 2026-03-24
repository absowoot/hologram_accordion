defmodule HologramSkeleton.DefaultLayout do
  use Hologram.Component

  alias Hologram.UI.Link

  def template do
    ~HOLO"""
    <!DOCTYPE html>
    <html>
      <head>
        <title>Hologram Skeleton</title>
        <Hologram.UI.Runtime />
        <link rel="stylesheet" href={asset_path("assets/app.css")} />
      </head>
      <body>
        <div class="max-w-screen-lg mx-auto p-4">
          <nav class="nav flex gap-4">
            <Link to={HologramSkeleton.Page1} class="p-4 py-2 bg-slate-200 border-1 border-slate-400 rounded-full">Page 1 (Fetch in init)</Link>
            <Link to={HologramSkeleton.Page2} class="p-4 py-2 bg-slate-200 border-1 border-slate-400 rounded-full">Page 2 (Fetch in private function)</Link>
            <Link to={HologramSkeleton.Page3} class="p-4 py-2 bg-slate-200 border-1 border-slate-400 rounded-full">Page 3 (Fetch in private function for command)</Link>
            <Link to={HologramSkeleton.Page4} class="p-4 py-2 bg-slate-200 border-1 border-slate-400 rounded-full">Page 4 (No Ash functions)</Link>
          </nav>

          <div class="divider my-4 border-t-2 border-slate-300">
            <slot />
          </div>
        </div>
      </body>
    </html>
    """
  end
end
