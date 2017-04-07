class Admin::AnalyzerController < ApplicationController
  def producs_company
  	company = params[:company]
  	@products = Admin::Product.where(company_id: company)
  end

  def products_category
  end

  def products_date
  end
end
