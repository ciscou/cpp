class ProductsController < ApplicationController
  before_action :ensure_admin_user, except: [:index, :search, :new_arrivals, :show]
  before_action :load_category, :except => [:search, :new_arrivals]

  before_action :check_for_mobile, only: [:index, :new_arrivals, :search, :show]

  respond_to :html

  def index
    @products = @category.products.order(created_at: :desc)
    @products = @products.includes(:category) # redundant, but hey...
    respond_with @category, @products
  end

  def search
    @products = localized_product_class.includes(:category)

    if params[:decoration_tag] && params[:decoration_code]
      @decoration = Decoration.find_by_tag_and_code!(params[:decoration_tag], params[:decoration_code])
      @products = @products.with_decoration(@decoration)
    end

    if params.key? :q
      @query = params[:q]
      @products = if @query.present?
                    @products.advanced_search @query
                  else
                    @products.none
                  end
    else
      @products = @products.order(created_at: :desc)
    end

    respond_with @products
  end

  def new_arrivals
    @products = Product.includes(:category).new_arrivals
    respond_with @products
  end

  def show
    load_product
    respond_with @category, @product
  end

  def new
    @product = @category.products.build
    respond_with @category, @product
  end

  def edit
    load_product
    respond_with @category, @product
  end

  def create
    @product = @category.products.build(product_attributes)
    @product.save
    respond_with @category, @product, :location => category_products_url(@category, :anchor => @product.to_param)
  end

  def update
    load_product
    @product.update_attributes(product_attributes)
    respond_with @category, @product, :location => category_products_url(@category, :anchor => @product.to_param)
  end

  def destroy
    load_product
    @product.destroy
    respond_with @category, @product
  end

  private

  def localized_product_class
    "#{I18n.locale}_product".classify.constantize
  end

  def load_category
    @category = Category.find(params[:category_id])
  end

  def load_product
    @product = @category.products.find(params[:id])
  end

  def product_attributes
    params.
      require(:product).
      permit(:es_name, :es_description, :en_name, :en_description, :fr_name, :fr_description, :picture, :new_arrival, :decoration_code)
  end
end
