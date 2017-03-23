class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
    @admin_companies = Admin::Company.all
  end

  def show
  end

  def new
    @admin_company = Admin::Company.new
  end

  def edit
  end

  def create
    @admin_company = Admin::Company.new(company_params)
    respond_to do |format|
      if @admin_company.save
        format.html {redirect_to admin_company_path(@admin_company), notice: "Company: #{@admin_company.name} was successfully created"}
        format.js
      else
        format.html {render :new}
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_company.update_attributes(company_params)
        format.html { redirect_to admin_company_path(@admin_company), notice: "Company: #{@admin_company.name} was successfully updated"}
        format.js
      else
        format.html { render :edit}
        format.js
      end
    end
  end

  def destroy
    @admin_company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_path, notice: "Company: #{@admin_company.name} was successfully deleted"}
      format.js
    end
  end

  private
  def set_company
  	@admin_company = Admin::Company.find(params[:id])
  end

  def company_params
  	params.require(:admin_company).permit(:name, :description)
  end
end
