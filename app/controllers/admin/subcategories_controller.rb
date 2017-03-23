class Admin::SubcategoriesController < ApplicationController
before_action :set_subcategory, only: [:show, :edit, :update, :destroy]

  # GET //admin/subcategories
  # GET /admin/subcategoriess.json
  def index
    @admin_subcategories = Admin::SubCategory.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /admin/categories/new
  def new
    @admin_subcategory = Admin::SubCategory.new
  end

  # GET /admin/subcategories/1/edit
  def edit
  end

  # POST /admin/subcategories
  # POST /admin/subcategories.json
  def create
    @admin_subcategory = Admin::SubCategory.new(admin_subcategory_params)

    respond_to do |format|
      if @admin_subcategory.save
        format.html { redirect_to admin_subcategory_path(@admin_subcategory), notice: "Subcategory: #{@admin_subcategory.name} was successfully created." }
        format.json { render :show, status: :created, location: @admin_subcategory }
      else
        format.html { render :new }
        format.json { render json: @admin_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/subcategories/1
  # PATCH/PUT /admin/subcategories/1.json
  def update
    respond_to do |format|
      if @admin_subcategory.update(admin_subcategory_params)
        format.html { redirect_to admin_subcategory_path(@admin_subcategory), notice: "Subcategory: #{@admin_subcategory.name} was successfully updated" }
        format.json { render :show, status: :ok, location: @admin_subcategory }
      else
        format.html { render :edit }
        format.json { render json: @admin_subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/subcategories/1
  # DELETE /admin/subcategories/1.json
  def destroy
  	flash[:notice] = "Subcategory: #{@admin_subcategory.name} was successfully destroyed."
    @admin_subcategory.destroy
    respond_to do |format|
      format.html { redirect_to admin_subcategories_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @admin_subcategory = Admin::SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_subcategory_params
      params.require(:admin_subcategory).permit(:name, :description, :category_id)
    end
end
