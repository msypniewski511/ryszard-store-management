class Admin::ProductsController < ApplicationController
  before_action :set_products, only: [:index, :destroy, :create, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /products
  # GET /products.json
  def index
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Admin::Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @admin_product = Admin::Product.new(admin_product_params)

    respond_to do |format|
      if @admin_product.save
        format.js { render :index }
        format.html { redirect_to @admin_product, notice: "Product: #{@admin_product.name} was successfully created." }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.js {render :new}
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.js {render :index}
        format.html { redirect_to @admin_product, notice: "Product: #{@admin_product.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    flash[:notice] = "Product: #{@admin_product.name} was successfully destroyed."
    @admin_product.destroy
    respond_to do |format|
      format.js {render :index}
      format.html { redirect_to admin_products_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @admin_product = Admin::Product.find(params[:id])
    end

    def set_products
      @products = Admin::Product.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_product_params
      params.require(:admin_product).permit(:name, :description, :company_id, :category_id, :subcategory_id, :image_url, :price)
    end

    def not_found
      message = "Foo with ID #{params[:id]} not found."
      logger.error message
      redirect_to not_found_url, info: message
    end
end
