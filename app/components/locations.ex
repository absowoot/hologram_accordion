defmodule HologramSkeleton.Components.Locations do
  use Hologram.Component

  def init(_params, component, _server) do
    # articles = HologramSkeleton.Articles.list_articles!()

    component
    |> put_state(:articles, [])
  end

  def template do
    ~HOLO"""
    <div class="articles">
      {%if Enum.empty?(@articles)}
        <p>No articles found.</p>
      {%else}
        {%for article <- @articles}
          <div class="article">
            <h2>{article.title}</h2>
            <p>{article.description}</p>
          </div>
        {/for}
      {/if}
    </div>
    """
  end
end
