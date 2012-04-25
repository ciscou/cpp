class CategoriesController < ApplicationController
  load_and_authorize_resource

  respond_to :html

  def index
    @categories = @categories.page params[:page]
    respond_with @categories
  end

  def new
    respond_with @category
  end

  def edit
    respond_with @category
  end

  def create
    @category.save
    respond_with @category, :location => category_products_path(@category)
  end

  def update
    @category.save
    respond_with @category, :location => category_products_path(@category)
  end

  def move_higher
    @category.move_higher
    respond_with @category, :location => categories_url
  end

  def move_lower
    @category.move_lower
    respond_with @category, :location => categories_url
  end

  def destroy
    @category.destroy
    respond_with @category
  end
end
