defmodule HologramSkeleton.Articles do
  use Ash.Domain, otp_app: :hologram_skeleton

  resources do
    resource HologramSkeleton.Articles.Article do
      define :list_articles
    end
  end
end
