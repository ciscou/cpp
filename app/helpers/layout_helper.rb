module LayoutHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def wrapper_class
    case params[:action]
    when "index", "brands"      then "listings"
    when "info", "show"         then "details"
    when "cs"                   then "single"
    else                             "default"
    end
  end

  def active_tab?(tab)
    case tab
    when "home"
      params[:controller] == "pages" and
      params[:action]     == "home"
    when "categories"
      params[:controller] == "categories" or
      params[:controller] == "products"
    when "who"
      params[:controller] == "pages" and
      params[:action]     == "who"
    when "where"
      params[:controller] == "pages" and
      params[:action]     == "where"
    when "contact"
      params[:controller] == "pages" and
      params[:action]     == "contact"
    end
  end
end
