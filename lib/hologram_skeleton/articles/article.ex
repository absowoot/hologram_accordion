defmodule HologramSkeleton.Articles.Article do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: HologramSkeleton.Articles

  postgres do
    table "articles"
    repo HologramSkeleton.Repo
  end

  actions do
    defaults [:read, :destroy]

    read :list_articles do
      argument :filter, :map, allow_nil?: true
      argument :private_feed?, :boolean, allow_nil?: false, default: false
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :slug, :string do
      allow_nil? false
      public? true
    end

    attribute :title, :string do
      allow_nil? false
      public? true
    end

    attribute :description, :string do
      allow_nil? false
      public? true
    end

    attribute :body_raw, :string do
      allow_nil? false
      default ""
      public? true
    end

    attribute :body, :string do
      allow_nil? false
      public? true
    end

    create_timestamp :created_at
    update_timestamp :updated_at
  end

  identities do
    identity :unique_slug, [:slug]
  end
end
