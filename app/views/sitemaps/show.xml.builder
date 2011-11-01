xml.urlset do

  # homepage
  xml.url do
    xml.loc        root_url
    xml.lastmod    Product.order(:created_at).last.try(:created_at)
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

  # contact static page
  xml.url do
    xml.loc        pages_contact_url
    xml.changefreq 'monthly'
    xml.priority   0.2
  end

  # categories
  xml.url do
    xml.log        categories_url
    xml.lastmod    Category.order(:created_at).last.try(:created_at)
    xml.changefreq 'weekly'
    xml.priority   1.0
  end

  # products
  Category.all.each do |category|
    xml.url do
      xml.log        category_products_url(category)
      xml.lastmod    category.products.order(:created_at).last.try(:created_at)
      xml.changefreq 'weekly'
      xml.priority   1.0
    end
  end

end
