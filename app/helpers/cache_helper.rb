module CacheHelper
  def cache_home_featured_products(&block)
    cpp_cache "home_featured_products", expires_in: 1.hour, race_condition_ttl: 10 do
      block.call
    end
  end

  def cache_category_new_arrivals(&block)
    cpp_cache latest_product_cache_key("category_new_arrivals"), &block
  end

  def cache_categories_index(&block)
    cpp_cache latest_product_cache_key("categories_index"), &block
  end

  def cache_category_products(category, &block)
    cpp_cache category, &block
  end

  def cache_products_new_arrivals(&block)
    cpp_cache latest_product_cache_key("products_new_arrivals"), &block
  end

  def cache_sidebar_highlighted_categories(&block)
    cpp_cache latest_product_cache_key("sidebar_highlighted_categories"), &block
  end

  def cache_sidebar_all_categories(&block)
    cpp_cache latest_category_cache_key("sidebar_all_categories"), &block
  end

  def cache_sidebar_decorations(&block)
    cpp_cache latest_category_cache_key("sidebar_decorations"), &block
  end

  private

  def cpp_cache(*keys, &block)
    options = keys.extract_options!
    keys.unshift(I18n.locale, mobile_device? ? :mobile : :desktop)

    cache keys, options do
      html = content_tag :div, class: "cache", data: { generated_at: Time.current.to_s(:db), key: keys.map { |k| k.respond_to?(:cache_key) ? k.cache_key : k }.join("/") } do
        block.call
      end
      safe_concat html
    end
  end

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
