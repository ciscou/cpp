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

  def search_title(decoration, search)
    if decoration.exists?
      "Productos de #{Decoration.human_tag_name decoration.tag} decorados en #{decoration.name}"
    elsif search.present?
      "Resultado de la búsqueda #{search.inspect}"
    else
      "Búsqueda"
    end
  end

  def search_description(decoration, search)
    if decoration.exists?
      "Ejemplos de productos de #{Decoration.human_tag_name decoration.tag} pintados a mano con nuestra decoración llamada #{decoration.name}"
    elsif search.present?
      "Productos que coinciden con la búsqueda #{search.inspect}"
    else
      "Búsqueda"
    end
  end

  def search_nothing_found(decoration, search)
    if decoration.exists?
      "Lo sentimos, no se ha encontrado ningún producto para la decoración #{decoration.name} de #{Decoration.human_tag_name decoration.tag}. Pero eso no significa que no los fabriquemos, llámenos y le informaremos."
    elsif search.present?
      "Lo sentimos, no se ha encontrado ningún producto para la búsqueda #{search.inspect}"
    else
      "Introduzca algo en la caja de búsqueda"
    end
  end
end
