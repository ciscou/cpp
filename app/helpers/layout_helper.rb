module LayoutHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def description(meta_description)
    content_for(:description) { meta_description }
  end

  def wrapper_class
    case action_name
    when "index"                  then controller_name == "products" ? "single" : "listings"
    when "show"                   then "details"
    when "search", "new_arrivals" then controller_name == "products" ? "single" : "default"
    else                               "default"
    end
  end

  def active_tab?(tab)
    case tab
    when "home", "who", "where"
      controller_name == "pages" and
      action_name     ==  tab
    when "categories"
      controller_name == "categories" or
      controller_name == "products"
    when "contact"
      controller_name == "contacts"
    end
  end
end
