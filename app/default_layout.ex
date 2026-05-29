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

        <footer class="bg-primary">
          <div class="container py-6 lg:py-10 mx-auto">
            <div class="flex">
              <div class="flex flex-col w-3/4">
                <h3 class="text-secondary font-bold text-4xl uppercase tracking-wider mb-3">
                  Links
                </h3>
                <nav aria-label="Secondary">
                  <ul class="text-xl uppercase tracking-wide flex flex-col lg:flex-row lg:flex-wrap font-gothic font-normal">
                    <li class="lg:w-1/3 lg:pr-8 mt-2 lg:mb-4">
                      <a href="/about-us" class="text-white">About Us</a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </footer>
      </body>
    </html>
    """
  end
end
