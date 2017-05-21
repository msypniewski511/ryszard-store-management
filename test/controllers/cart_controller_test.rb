require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest

  
  test "adding item to the cart" do
  	assert_difference('CartItem.count', 1) do
  	  post cart_add_path, params: { id: 1 }
  	end

  	assert_response :redirect
  	assert_redirected_to catalog_index_path
  	assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  test "adding item to the cart with xhr" do
  	assert_difference('CartItem.count', 1) do
  	  post cart_add_path, params: { id: 1 }, xhr: true
  	  #post cart_add_path(id: 1), xhr: true
  	end

  	assert_response :success
  	assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end
end
