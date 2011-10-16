module LayoutHelper
  def wrapper_class
    case params[:action]
    when "index", "brands"      then "listings"
    when "info"                 then "details"
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
      params[:controller] == "categories"
    when "brands"
      params[:controller] == "pages" and
      params[:action]     == "brands"
    when "cs"
      params[:controller] == "pages" and
      params[:action]     == "cs"
    when "info"
      params[:controller] == "pages" and
      params[:action]     == "info"
    when "contact"
      params[:controller] == "pages" and
      params[:action]     == "contact"
    end
  end
end
