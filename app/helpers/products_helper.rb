# encoding: utf-8

module ProductsHelper
  def new_arrivals_path
    if can? :new_arrivals, :products
      new_arrivals_products_path
    else
      pages_new_arrivals_path
    end
  end

  def new_arrivals_url
    if can? :new_arrivals, :products
      new_arrivals_products_url
    else
      pages_new_arrivals_url
    end
  end

  def link_to_search_products(query)
    link_to "Búsqueda '#{query}' (#{Product.accessible_by(current_ability).search(query).count})",
      search_products_path(:q => '#{query}')
  end
end
