class ProductsController < ApplicationController
  before_filter :load_category, :except => :search # FIXME change to load_and_authorize_resource :category

  load_and_authorize_resource :through => :category, :except => :search
  load_and_authorize_resource                        :only   => :search

  respond_to :html

  def index
    respond_with [@category, @products]
  end

  def search
    @products = @products.search(params[:q])
    respond_with @products, :template => "products/index"
  end

  def show
    respond_with [@category, @product]
  end

  def new
    respond_with [@category, @product]
  end

  def edit
    respond_with [@category, @product]
  end

  def create
    @product.save
    respond_with [@category, @product], :location => category_products_url(@category, :anchor => @product.to_param)
  end

  def update
    @product.save
    respond_with [@category, @product], :location => category_products_url(@category, :anchor => @product.to_param)
  end

  def destroy
    @product.destroy
    respond_with [@category, @product]
  end

  private

  def load_category
    @category = Category.find(params[:category_id])
  end
end
