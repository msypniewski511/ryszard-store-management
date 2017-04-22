class Admin::ProductsController < ApplicationController
  before_action :set_products, only: [:destroy, :create, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_sort, only: :index
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /products
  # GET /products.json
  def index
    @page_title = "Lista produktow"
      respond_to do |format|
        format.html
        format.js
      end
    @products_count = Admin::Product.all.size
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
        format.html { redirect_to admin_index_path}
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.js {render :new}
        #format.html { render :new }
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
      params.require(:admin_product).permit(:name, :description, :company_id, :category_id, :subcategory_id, :price, :image)
    end

    def not_found
      message = "Foo with ID #{params[:id]} not found."
      logger.error message
      @products = Admin::Product.first
    end

    def set_sort
      if session[:company]  == nil then
        session[:company] = 1
        session[:category] = 1
        session[:name] = 1
        session[:subcategory]
        session[:up] = 1
        session[:typ] = 1
      end
      @products = []
      sort_type = params[:sort_by]
      # Sortowanie wzgledem company
      if sort_type == 'company_id' then
        if session[:company] == 1 then
          session[:company] = -1
          @companies = Admin::Company.order(name: :ASC)
        else
          @companies = Admin::Company.order(name: :DESC)
          session[:company] = 1
        end
        @companies.each do |c|
          @products = @products + c.products
        end
        session[:typ] = 2
        session[:up_company] = session[:company]
      #Sortowanie wzgledem category
      elsif sort_type == 'category_id' then
        if session[:category] == 1 then
          session[:category] = -1
          @categories = Admin::Category.order('name')
        else
          session[:category] = 1
          @categories = Admin::Category.order(name: :DESC)
        end
        @categories.each do |c|
          @products = @products + c.products
        end
        session[:typ] = 3
      elsif sort_type == 'subcategory_id' then
        if session[:subcategory] == 1 then
          session[:subcategory] = -1
          @products = Admin::Product.order(subcategory_id: :ASC)
        else
          session[:subcategory] = 1
          @products = Admin::Product.order(subcategory_id: :DESC)
        end
        session[:typ] = 4
      # Sortowanie wzgledem productu
      else
        if session[:name] == 1 then
          session[:name] = -1
          @products = Admin::Product.order(name: :ASC)
        else
          session[:name] = 1
          @products = Admin::Product.order(name: :DESC)
        end
        session[:typ] = 1
      end# Koniec opcji sortowania
    end# Koniec medody sort
end
