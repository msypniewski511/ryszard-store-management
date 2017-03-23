class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_company
  	@admin_company = Admin::Company.find(params[:id])
  end

  def company_params
  	params.require(:admin_company).permit(:name, :description)
  end
end
