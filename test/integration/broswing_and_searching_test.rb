require 'test_helper'

class BroswingAndSearchingTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "show new products" do
    get catalog_news_path
    assert_response :success
    assert_template 'catalog/news'
  end

  test "broswing the site" do
  	maciej = enter_site(:maciej)
  	maciej.broswe_index
  end

  test "getting the details" do
  	maciej = enter_site(:maciej)
  	maciej.get_product_details_for("Vitamina c")
  end

  private

  module BroswingTestDSL
    attr_writer :name

    def broswe_index
      get catalog_index_path

      assert_response :success
      assert_template 'catalog/index'
      assert_select 'div'
      check_product_links
    end
  

    def get_product_details_for(name)
  	  @product = Admin::Product.find_by_name(name)
  	  get catalog_show_path(@product.id)
  	  assert_response :success
  	  #assert_template 'catalog/index'
      assert_select 'h1', @product.name
      assert_select 'h2', Admin::Category.find(@product.category_id).name
    end
  end

  def enter_site(name)
    open_session do |session|
      session.extend(BroswingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end

  def check_product_links
    for product in assigns(:products)
      assert_select 'a'
    end
  end
end
