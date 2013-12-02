module CacheHelper
  def sidebar_highlighted_categories_cache_key
    latest_product_cache_key("sidebar_highlighted_categories")
  end

  def sidebar_all_categories_cache_key
    latest_category_cache_key("sidebar_all_categories")
  end

  def sidebar_decorations_cache_key
    latest_category_cache_key("sidebar_decorations")
  end

  def new_arrivals_cache_key
    latest_product_cache_key("new_arrivals")
  end

  def all_categories_cache_key
    latest_category_cache_key("all_categories")
  end

  private

  def latest_product_cache_key(prefix)
    latest_model_cache_key(Product, prefix)
  end

  def latest_category_cache_key(prefix)
    latest_model_cache_key(Category, prefix)
  end

  def latest_model_cache_key(model, prefix)
    count          = model.count
    max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{prefix}/#{count}-#{max_updated_at || 0}"
  end
end
