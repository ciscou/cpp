# encoding: utf-8

module ProductsHelper
  def new_arrivals_path(options = {})
    if can? :new_arrivals, :products
      new_arrivals_products_path options
    else
      pages_new_arrivals_path options
    end
  end

  def new_arrivals_url(options = {})
    if can? :new_arrivals, :products
      new_arrivals_products_url options
    else
      pages_new_arrivals_url options
    end
  end

  def accessible_products
    Product.accessible_by current_ability
  end

  def link_to_search_products(query)
    link_to t(".highlighted_search", query: query, count: accessible_products.advanced_search(query).count),
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
      "Productos de #{Decoration.human_tag_name decoration.tag} decorados en #{decoration.name}"
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
      "Ejemplos de productos de #{Decoration.human_tag_name decoration.tag} decorados en #{decoration.name}"
    else
      "Nuestras últimas creaciones, lo más nuevo del mercado"
    end
  end

  def products_index_nothing_found(category, decoration, search)
    if category
      "Lo sentimos, no se ha encontrado ningún producto en la categoría #{category.name}"
    elsif search
      "Lo sentimos, no se ha encontrado ningún producto para la búsqueda #{search.inspect}"
    elsif decoration
      "La decoración #{Decoration.human_tag_name decoration.tag} es una de nuestras #{link_to "últimas novedades", new_arrivals_path}, necesita una cuenta de cliente para poder verla. Si ya tiene una cuenta de cliente, por favor #{link_to "inicie sesión", new_user_session_path}. Si no, #{link_to "cree una cuenta", new_user_registration_path} y #{link_to "contacte con nosotros", new_contact_path}.".html_safe
    else
      "Lo sentimos, no se ha encontrado ningún producto en últimas novedades"
    end
  end
end
