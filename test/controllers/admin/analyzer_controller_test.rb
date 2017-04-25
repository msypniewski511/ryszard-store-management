require 'test_helper'

class Admin::AnalyzerControllerTest < ActionDispatch::IntegrationTest


  test "should get products_date" do
    get admin_analyzer_products_date_url
    assert_response :success
  end

end
