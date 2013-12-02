require 'ostruct'

xml.instruct!

xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

  I18n.available_locales.each do |locale|

  # homepage
  xml.url do
    xml.loc        localized_root_url locale: locale
    xml.lastmod    object_updated_at_or_now(@products.last).iso8601
    xml.changefreq 'always'
    xml.priority   0.8
  end

  # who static page
  xml.url do
    xml.loc        pages_who_url locale: locale
    xml.changefreq 'monthly'
    xml.priority   0.8
  end

  # where static page
  xml.url do
    xml.loc        pages_where_url locale: locale
    xml.changefreq 'monthly'
    xml.priority   0.8
  end

  # botijo page
  xml.url do
    xml.loc        pages_botijo_url locale: locale
    xml.changefreq 'monthly'
    xml.priority   0.2
  end

  # our environment page
  xml.url do
    xml.loc        pages_environment_url locale: locale
    xml.changefreq 'monthly'
    xml.priority   0.2
  end

  # contact us page
  xml.url do
    xml.loc        new_contact_url locale: locale
    xml.changefreq 'monthly'
    xml.priority   0.2
  end

  # catalog
  xml.url do
    xml.loc        categories_url locale: locale
    xml.lastmod    object_updated_at_or_now(@categories.last).iso8601
    xml.changefreq 'weekly'
    xml.priority   1.0
  end

  # categories
  @categories.each do |category|
    xml.url do
      xml.loc        category_products_url(category, locale: locale)
      xml.lastmod    object_updated_at_or_now(@products_by_category_id[category.id].last).iso8601
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

  # decorations
  Decoration.all.each do |decoration|
    xml.url do
      xml.loc        search_products_url(decoration_tag: decoration.tag, decoration_code: decoration.code, locale: locale)
      xml.lastmod    object_updated_at_or_now(@products_by_decoration_tag_and_code[[decoration.tag, decoration.code]].last).iso8601
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

  # products
  @products.each do |product|
    xml.url do
      xml.loc        category_product_url(product.category, product, locale: locale)
      xml.lastmod    product.updated_at.iso8601
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

  # new arrivals section
  xml.url do
    xml.loc        new_arrivals_products_url locale: locale
    xml.lastmod    object_updated_at_or_now(@new_arrivals.last).iso8601
    xml.changefreq 'weekly'
    xml.priority   0.7
  end

  end

end
