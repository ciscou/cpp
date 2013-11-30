# encoding: utf-8

module ProductsHelper
  def link_to_search_products(query)
    link_to t(".highlighted_search", query: query, count: Product.advanced_search(query).count),
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
    elsif search.present?
      "Resultado de la búsqueda #{search.inspect}"
    elsif search
      "Búsqueda"
    elsif decoration
      "Productos de #{Decoration.human_tag_name decoration.tag} decorados en #{decoration.name}"
    else
      "Últimas novedades"
    end
  end

  def products_index_description(category, decoration, search)
    if category
      category.description
    elsif search.present?
      "Productos que coinciden con la búsqueda #{search.inspect}"
    elsif search
      "Búsqueda"
    elsif decoration
      "Ejemplos de productos de #{Decoration.human_tag_name decoration.tag} decorados en #{decoration.name}"
    else
      "Nuestras últimas creaciones, lo más nuevo del mercado"
    end
  end

  def products_index_nothing_found(category, decoration, search)
    if category
      "Lo sentimos, no se ha encontrado ningún producto en la categoría #{category.name}"
    elsif search.present?
      "Lo sentimos, no se ha encontrado ningún producto para la búsqueda #{search.inspect}"
    elsif search
      "Introduzca algo en la caja de búsqueda"
    elsif decoration
      "La decoración #{Decoration.human_tag_name decoration.tag} es una de nuestras #{link_to "últimas novedades", new_arrivals_products_path}, necesita una cuenta de cliente para poder verla. Si ya tiene una cuenta de cliente, por favor #{link_to "inicie sesión", new_user_session_path}. Si no, #{link_to "cree una cuenta", new_user_registration_path} y #{link_to "contacte con nosotros", new_contact_path}.".html_safe
    else
      "Lo sentimos, no se ha encontrado ningún producto en últimas novedades"
    end
  end
end
