class Admin::AnalyzerController < ApplicationController
  def products_company
  	@company = Admin::Company.find(params[:company])
  	@products = Admin::Product.where(company_id: @company.id)
  end

  def products_category
  	@category = Admin::Category.find(params[:id])
  	@products = Admin::Product.where(category_id: @category.id)
  end

  def products_date
  end

  def products_by_expiry_date
  	@products_expiry = ExpiryDate.where(product_id: params[:id])
  	@product = Admin::Product.find(params[:id]) 
  end
end
