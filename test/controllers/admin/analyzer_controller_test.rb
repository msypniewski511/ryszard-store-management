require 'test_helper'

class Admin::AnalyzerControllerTest < ActionDispatch::IntegrationTest
  test "should get producs_company" do
    get admin_analyzer_producs_company_url
    assert_response :success
  end

  test "should get products_category" do
    get admin_analyzer_products_category_url
    assert_response :success
  end

  test "should get products_date" do
    get admin_analyzer_products_date_url
    assert_response :success
  end

end
