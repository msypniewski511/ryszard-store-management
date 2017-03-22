require 'test_helper'

class Admin::SubCategoryTest < ActiveSupport::TestCase
  def setup
  	@subc = Admin::SubCategory.create(name: "nazwa", description: "description", category_id: 1)
  end
  test "subcategory should be not empty name" do
  	subc = Admin::SubCategory.new(name: "", description: "description", category_id: 1)
  	assert subc.invalid?, "empty name give invalid record"
  	assert subc.errors[:name].any?
  	assert_not subc.save
  end

  test "shoud have id_category not empty" do
  	subc = Admin::SubCategory.new(name: "nazwa", description: "description")
  	assert subc.invalid?
  	assert_not subc.save
  end

  test "name attribute should be unique" do
  	c = Admin::SubCategory.new(name: @subc.name, description: "description", category_id: 1)
  	assert c.invalid?
  	assert_not c.save
  end

  test "should update subcategory" do
  	c = Admin::SubCategory.create(name: "inna nazwa", description: "description2", category_id: 1)
  	assert c.update(name: "nazwa", description: "description1")
  end

  test "should destroy" do
  	c = Admin::SubCategory.create(name: "inna nazwa", description: "description2", category_id: 1)
  	count = Admin::SubCategory.all.count
  	assert c.destroy
  	assert_equal count, Admin::SubCategory.all.count + 1
  end
end
