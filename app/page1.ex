defmodule HologramSkeleton.Page1 do
  use Hologram.Page

  route "/"

  layout HologramSkeleton.DefaultLayout

  def init(_params, component, _server) do
    articles = HologramSkeleton.Articles.list_articles!()

    component
    |> put_state(:articles, articles)
  end

  def template do
    ~HOLO"""
    <h1>Page with Ash articles</h1>

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
