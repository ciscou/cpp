module LayoutHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def description(meta_description)
    content_for(:description) { meta_description }
  end

  def wrapper_class
    return @wrapper_class if @wrapper_class.present?

    case action_name
    when "index"                  then controller_name == "products" ? "single" : "listings"
    when "show"                   then "details"
    when "search", "new_arrivals" then controller_name == "products" ? "single" : "default"
    else                               "default"
    end
  end

  def active_tab?(tab)
    case tab
    when "who"
      controller_name == "pages" and
      action_name.in? %w[who how_we_work]
    when "home", "where"
      controller_name == "pages" and
      action_name     ==  tab
    when "categories"
      controller_name == "categories" or
      controller_name == "products" or
      (
        controller_name == "pages" and
        action_name == "new_arrivals"
      )
    when "contact"
      controller_name == "contacts"
    end
  end

  def link_to_locale(body, locale)
    link_to_unless I18n.locale == locale, body, params.merge(:locale => locale)
  end
end
