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

  def products_index_title(category, decoration, search)
    if category
      category.name + if decoration
                        " decorados en #{decoration.name}"
                      else
                        ""
                      end
    elsif search
      "Resultado de la búsqueda #{search.inspect}"
    else
      "Últimas novedades"
    end
  end

  def products_index_description(category, decoration, search)
    if category
      category.description + if decoration
                               " Se muestran los productos decorados en #{decoration.name}"
                             else
                               ""
                             end
    elsif search
      "Productos que coinciden con la búsqueda #{search.inspect}"
    else
      "Nuestras últimas creaciones, lo más nuevo del mercado"
    end
  end
end
