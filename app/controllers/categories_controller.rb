class CategoriesController < ApplicationController
  before_filter :ensure_admin_user, except: :index

  respond_to :html

  def index
    @categories = Category.page params[:page]
    respond_with @categories
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
    load_category
    respond_with @category
  end

  def create
    @category = Category.new(category_attributes)
    @category.save
    respond_with @category, :location => category_products_path(@category)
  end

  def update
    load_category
    @category.update_attributes(category_attributes)
    respond_with @category, :location => category_products_path(@category)
  end

  def move_higher
    load_category
    @category.move_higher
    respond_with @category, :location => categories_url
  end

  def move_lower
    load_category
    @category.move_lower
    respond_with @category, :location => categories_url
  end

  def destroy
    load_category
    @category.destroy
    respond_with @category
  end

  private

  def load_category
    @category = Category.find(params[:id])
  end

  def category_attributes
    params[:category]
  end
end
