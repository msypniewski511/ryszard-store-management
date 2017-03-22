require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@base_title = "Store - administration."
  end
  test "should get index" do
    get static_pages_index_url
    assert_response :success
    assert_select 'h1', 'Strona startowa sklepu.'
    assert_select 'title', "Home | #{@base_title}"
    assert_select 'header'
    assert_select 'footer'
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', "About | #{@base_title}"
  end

  test "should get contact" do
  	get static_pages_contact_url
  	assert_response :success
  	assert_select 'Contact', "Home | #{@base_title}"
  	assert_select 'h1', 'Contact and address'
  end

end
