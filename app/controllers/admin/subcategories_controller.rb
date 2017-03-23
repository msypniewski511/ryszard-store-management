class Admin::SubcategoriesController < ApplicationController
before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Admin::SubCategory.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_category = Admin::SubCategory.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    #raise params.inspect
    @admin_category = Admin::SubCategory.new(admin_category_params)

    respond_to do |format|
      if @admin_category.save
        format.html { redirect_to admin_subcategory_path(@admin_category), notice: "Subcategory: #{@admin_category.name} was successfully created." }
        format.json { render :show, status: :created, location: @admin_category }
      else
        format.html { render :new }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @admin_category.update(admin_category_params)
        format.html { redirect_to admin_subcategory_path(@admin_category), notice: "Subcategory: #{@admin_category.name} was successfully updated" }
        format.json { render :show, status: :ok, location: @admin_category }
      else
        format.html { render :edit }
        format.json { render json: @admin_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    flash[:notice] = "Subcategory: #{@admin_category.name} was successfully deleted"
    @admin_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_subcategories_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @admin_category = Admin::SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_category_params
      params.fetch(:admin_sub_category, {}).permit(:name, :description, :category_id)
      #params.require(:admin_sub_category).permit(:name, :description, :category_id)
    end

end
