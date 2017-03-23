require 'test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Admin::Category.first
  end

  test "should get index" do
    get admin_categories_path
    assert_response :success
  end

  test "should get new" do
    get new_admin_category_path
    assert_response :success
  end

  test "should create category" do
    assert_difference('Admin::Category.count') do
      post admin_categories_url, params: { admin_category: { description: @category.description, name: "Now nazwa" } }
    end

    assert_redirected_to admin_category_path(Admin::Category.last)
  end

  test "should show category" do
    get admin_category_path(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_category_path(@category)
    assert_response :success
  end

  test "should update category" do
    patch admin_category_path(@category), params: { admin_category: { description: @category.description, name: @category.name } }
    assert_redirected_to admin_category_path(@category)
  end

  test "should destroy category" do
    assert_difference('Admin::Category.count', -1) do
      delete admin_category_path(@category)
    end
    #assert_equal @category.subcategoies, nill
    assert_redirected_to admin_categories_path
  end
end
