class CartController < ApplicationController
  before_action :initialize_cart
  
  def add
  	@product = Admin::Product.find(params[:id])
    @item = @cart.add(params[:id])
    string_flash = "Dodano <em class=flash_catalog >#{@product.name}</em> do koszyka ajax"
    flash[:cart_notice] = string_flash
    respond_to do |format|
      format.html { redirect_to controller: 'catalog' }
      format.js { @current_item = params[:id] }
    end
  end

  def remove
    @product = Admin::Product.find(params[:id])
    @item = @cart.remove(params[:id])
    flash.now[:cart_notice] = "Removed 1 <em class=flash_catalog >#{@item.product.name}</em>"
    respond_to do |format|
      format.html { redirect_to controller: 'catalog'}
      format.js { @current_item = params[:id] }
    end
  end

  def clear
    @cart.cart_items.destroy_all
    flash.now[:cart_notice] = "<em>Cleared the cart</em>"
    respond_to do |format|
      format.js
      format.html{ redirect_to controller: 'catalog'}
    end
  end
end