require 'test_helper'

class CatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalog_index_url
    assert_response :success
  end

  test "should get show" do
    get catalog_index_url,params: {id: 1}
    assert_response :success
  end

  test "should get search" do
    get catalog_search_url
    assert_response :success
  end

  test "should get news" do
    get catalog_news_url
    assert_response :success
  end

end
