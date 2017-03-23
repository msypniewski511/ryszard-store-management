require 'test_helper'

class Admin::SubcategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @admin_subcategory = Admin::SubCategory.first
  end

  test "should get index" do
    get admin_subcategories_path
    assert_response :success
    assert_select 'h3', "Listing subcategories"
    assert_select "table"
  end

  test "should get new" do
    get new_admin_subcategory_path
    assert_response :success
    assert_select 'legend', "Enter new subcategory details:"
  end

  test "should create subcategory" do
    assert_difference('Admin::SubCategory.count') do
      post admin_subcategories_path, params: { admin_subcategory: { description: @admin_subcategory.description, name: "Now nazwa", category_id: @admin_subcategory.category_id } }
    end

    assert_redirected_to admin_subcategory_path(Admin::SubCategory.last)
    assert_equal "Subcategory: Nowa nazwa was successfully created", flash[:notice]
  end

  test "should show subcategory" do
    get admin_subcategory_path(@admin_subcategory)
    assert_response :success
    assert_select "h3", "#{@admin_subcategory.name}"
  end

  test "should get edit" do
    get edit_admin_subcategory_path(@admin_subcategory)
    assert_response :success
    assert_select "legend", "Enter new details:"
  end

  test "should update subcategory" do
    patch admin_subcategory_path(@admin_subcategory), params: { admin_subcategory: { description: @admin_subcategory.description, name: @admin_subcategory.name, category_id: @admin_subcategory  } }
    assert_redirected_to admin_subcategory_path(@admin_subcategory)
    assert_equal "Subcategory: #{@admin_subcategory.name} was successfully updated", flash[:notice]
  end

  test "should destroy subcategory" do
    assert_difference('Admin::SubCategory.count', -1) do
      delete admin_subcategory_path(@admin_subcategory)
    end

    assert_redirected_to admin_subcategories_path
    assert_equal "Subcategory: #{@admin_subcategory.name} was successfully deleted", flash[:notice]
  end
end
