class CartController < ApplicationController
  before_action :initialize_cart
  
  def add
  	@product = Admin::Product.find(params[:id])
    @item = @cart.add(params[:id])
    string_flash = "Dodano #{@product.name} do koszyka ajax"
    flash[:cart_notice] = string_flash
    respond_to do |format|
      format.html { redirect_to controller: 'catalog' }
      format.js { @current_item = params[:id] }
    end



  end
end