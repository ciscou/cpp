class SitemapsController < ApplicationController
  def show
    @products = Product.includes(:category).reorder(:updated_at).to_a
    @products_by_category_id              = @products.group_by(&:category_id)
    @products_by_decoration_tag_and_code  = @products.group_by { |p| [ p.category.decoration_tag, p.decoration_code ] }
    @new_arrivals                         = @products.select(&:new_arrival?)

    @categories = Category.reorder(:updated_at).to_a
  end
end
