defmodule HologramSkeleton.DefaultLayout do
  use Hologram.Component

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
        <slot />
      </body>
    </html>
    """
  end
end
