defmodule HologramSkeleton.Page3 do
  use Hologram.Page

  route "/page-3"

  layout HologramSkeleton.DefaultLayout

  def init(_params, component, _server) do
    component
    |> put_state(:articles, [])
  end

  def template do
    ~HOLO"""
    <h1>Page with articles from command</h1>

    <button $click="fetch_articles" class="px-4 py-2 bg-blue-500 text-white rounded">Fetch Articles</button>

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

  def command(:fetch_articles, _args, component, _server) do
    articles = fetch_articles()

    component
    |> put_state(:articles, articles)
  end

  defp fetch_articles do
    HologramSkeleton.Articles.list_articles!()
  end
end
