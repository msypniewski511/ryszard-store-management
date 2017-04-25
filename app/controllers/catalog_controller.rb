class CatalogController < ApplicationController
  def index
  	@title = "Product List"
  	@size = Admin::Product.count
  	@products = Admin::Product.order(name: :ASC).paginate(per_page: 5, :page => params[:page])
  end

  def show
    begin
      @product = Admin::Product.find(params[:id])
      @category = Admin::Category.find(@product.category_id)
      @company = Admin::Company.find(@product.company_id)
      @title = @product.name
    rescue ActiveRecord::RecordNotFound => e
      render(text: "Not found", status: 404)
    end
  end

  def search
    @title = "Search"
    if params[:commit] == "Szukaj" || params[:query]
      regex = "^#{params[:query]}+"
      @products = Admin::Product.where("name ~* ?", regex)
      unless @products.size > 0
        flash.now[:notice] = "Brak produktow spelniajacych twoje kryteria."
      end
    end
    #@products = Admin::Product.find_with_ferret(params[:query])

  end

  def news
  end
end
