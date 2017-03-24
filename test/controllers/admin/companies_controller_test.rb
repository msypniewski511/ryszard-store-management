require 'test_helper'

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @admin_company = Admin::Company.first
  end

  test "should get index" do
    get admin_companies_path
    assert_response :success
    assert_select 'h3', "Listing companies"
    assert_select "table"
  end

  test "should get new" do
    get new_admin_company_path
    assert_response :success
    assert_select 'legend', "Enter New Company Details:"
  end

  test "should create company" do
    assert_difference('Admin::Company.count') do
      post admin_companies_path, params: { admin_company: { description: "Description", name: "Nowa nazwa" } }
    end

    assert_redirected_to admin_company_url(Admin::Company.last)
    assert_equal "Company: Nowa nazwa was successfully created", flash[:notice]
  end

  test "should show company" do
    get admin_company_url(@admin_company)
    assert_response :success
    assert_select "h3", "#{@admin_company.name}"
  end

  test "should get edit" do
    get edit_admin_company_path(@admin_company)
    assert_response :success
    assert_select "legend", "Edit Company Details:"
  end

  test "should update company" do
    patch admin_company_path(@admin_company), params: { admin_company: { description: @admin_company.description, name: @admin_company.name } }
    assert_redirected_to admin_company_path(@admin_company)
    assert_equal "Company: #{@admin_company.name} was successfully updated", flash[:notice]
  end

  test "should destroy company" do
    assert_difference('Admin::Company.count', -1) do
      delete admin_company_path(@admin_company), remote: true
    end

    assert_redirected_to admin_companies_path
    assert_equal "Company: #{@admin_company.name} was successfully deleted", flash[:notice]
  end


end
