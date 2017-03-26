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
      post expiry_dates_url, params: { expiry_date: { count: @expiry_date.count, date_added: @expiry_date.date_added, date_expiry: @expiry_date.date_expiry, part_number: @expiry_date.part_number, product_id: @expiry_date.product_id } }
    end

    assert_redirected_to expiry_date_url(ExpiryDate.last)
  end

  test "should show expiry_date" do
    get expiry_date_url(@expiry_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_expiry_date_url(@expiry_date)
    assert_response :success
  end

  test "should update expiry_date" do
    patch expiry_date_url(id: @expiry_date.id), params: { expiry_date: { count: @expiry_date.count, date_added: @expiry_date.date_added, date_expiry: @expiry_date.date_expiry, part_number: @expiry_date.part_number, product_id: @expiry_date.product_id } }
    assert_redirected_to expiry_date_url(@expiry_date)
  end

  test "should destroy expiry_date" do
    assert_difference('ExpiryDate.count', -1) do
      delete expiry_date_url(@expiry_date)
    end

    assert_redirected_to expiry_dates_url
  end
end
