xml.instruct!

xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  # homepage
  xml.url do
    xml.loc        root_url
    xml.lastmod    Product.order(:updated_at).last.try(:updated_at).try(:iso8601)
    xml.changefreq 'always'
    xml.priority   0.8
  end

  # who static page
  xml.url do
    xml.loc        pages_who_url
    xml.changefreq 'monthly'
    xml.priority   0.8
  end

  # where static page
  xml.url do
    xml.loc        pages_where_url
    xml.changefreq 'monthly'
    xml.priority   0.8
  end

  # contact us page
  xml.url do
    xml.loc        new_contact_url
    xml.changefreq 'monthly'
    xml.priority   0.2
  end

  # catalog
  xml.url do
    xml.loc        categories_url
    xml.lastmod    Category.order(:updated_at).last.try(:updated_at).try(:iso8601)
    xml.changefreq 'weekly'
    xml.priority   1.0
  end

  # categories
  Category.all.each do |category|
    xml.url do
      xml.loc        category_products_url(category)
      xml.lastmod    category.products.order(:updated_at).last.try(:updated_at).try(:iso8601)
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

  # products
  accessible_products.all.each do |product|
    xml.url do
      xml.loc        category_product_url(product.category, product)
      xml.lastmod    product.updated_at.iso8601
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

  # new arrivals section
  xml.url do
    xml.loc        new_arrivals_url
    xml.lastmod    Product.new_arrivals.last.try(:updated_at).try(:iso8601)
    xml.changefreq 'weekly'
    xml.priority   0.7
  end

end
