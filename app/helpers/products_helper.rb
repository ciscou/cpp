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
      search_products_path(:q => query)
  end

  def link_to_decoration(decoration, options = {})
    link_to decoration.name,
      search_products_path(:decoration_tag => decoration.tag, :decoration_code => decoration.code),
      options
  end

  def products_index_title(category, decoration, search)
    if category
      category.name
    elsif search
      "Resultado de la búsqueda #{search.inspect}"
    elsif decoration
      "Productos decorados en #{decoration.name}"
    else
      "Últimas novedades"
    end
  end

  def products_index_description(category, decoration, search)
    if category
      category.description
    elsif search
      "Productos que coinciden con la búsqueda #{search.inspect}"
    elsif decoration
      "Ejemplos de productos decorados en #{decoration.name}"
    else
      "Nuestras últimas creaciones, lo más nuevo del mercado"
    end
  end
end
