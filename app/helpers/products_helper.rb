module ProductsHelper
  def new_arrivals_path
    if can? :new_arrivals, :products
      new_arrivals_products_path
    else
      pages_new_arrivals_path
    end
  end
end
