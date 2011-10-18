class ProductsController < ApplicationController
  before_filter :load_category

  # GET /products
  # GET /products.json
  def index
    @products = if @category
                  @category.products.all
                else
                  Product.search(params[:q])
                end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = @category.products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = @category.products.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = @category.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @category.products.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to [@category, @product], notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = @category.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to [@category, @product], notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = @category.products.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to category_products_url(@category) }
      format.json { head :ok }
    end
  end

  private

  def load_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
end
