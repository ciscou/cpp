module LayoutHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def description(meta_description)
    content_for(:description) { meta_description }
  end

  def wrapper_class
    case params[:action]
    when "index"                  then params[:controller] == "products" ? "single" : "listings"
    when "show"                   then "details"
    when "search", "new_arrivals" then params[:controller] == "products" ? "single" : "default"
    else                               "default"
    end
  end

  def active_tab?(tab)
    case tab
    when "home", "who", "where", "contact"
      params[:controller] == "pages" and
      params[:action]     ==  tab
    when "categories"
      params[:controller] == "categories" or
      params[:controller] == "products"
    end
  end
end
