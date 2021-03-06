class PagesController < ApplicationController
  before_action :check_for_mobile, only: [:home, :who, :where]

  def home
    @products = Product.includes(:category).featured
  end

  def error_404
    respond_to do |format|
      format.html
      format.any { head(404) }
    end
  end
end
