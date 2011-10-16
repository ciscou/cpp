module LayoutHelper
  def wrapper_class
    case params[:action]
    when "list"       then "listings"
    when "info"       then "details"
    when "one_column" then "single"
    else                   "default"
    end
  end
end
