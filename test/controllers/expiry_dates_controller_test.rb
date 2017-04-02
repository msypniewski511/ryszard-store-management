require 'test_helper'

class ExpiryDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expiry_date = ExpiryDate.first
  end

  test "should get index" do
    get expiry_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_expiry_date_url
    assert_response :success
  end

  test "should create expiry_date" do
    assert_difference('ExpiryDate.count') do
      post expiry_dates_url, params: { expiry_date: { product_id: Admin::Product.first.id, count: 1, date_expiry: Time.now, time_expiry: Time.now } }
    end

    assert_response :redirect
  end


  test "should show expiry_date" do
    get expiry_date_path(@expiry_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_expiry_date_url(@expiry_date)
    assert_response :success
  end

  test "should update expiry_date" do
    patch expiry_date_url(@expiry_date), params: { expiry_date: { product_id: Admin::Product.first.id, count: 1, date_expiry: Time.now, time_expiry: Time.now } }
    assert_redirected_to @expiry_date
  end

  test "should destroy expiry_date" do
    assert_difference('ExpiryDate.count', -1) do
      delete expiry_date_url(@expiry_date)
    end

    assert_redirected_to expiry_dates_url
  end
end
