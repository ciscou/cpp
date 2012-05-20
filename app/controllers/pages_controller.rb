class PagesController < ApplicationController
  def new_arrivals
    if can? :new_arrivals, :products
      redirect_to new_arrivals_products_path
    end
  end
end
