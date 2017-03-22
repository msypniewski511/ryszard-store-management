require 'test_helper'

class Admin::CategoryTest < ActiveSupport::TestCase

  def setup
  	@category = Admin::Category.create(name: "nazwa", description: "description")
  end
  test "category should be not empty name" do
  	category = Admin::Category.new(name: "", description: "description")
  	assert category.invalid?, "empty name give invalid record"
  	assert category.errors[:name].any?
  	assert_not category.save
  end

  test "name sttribute should be unique" do
  	c = Admin::Category.new(name: @category.name, description: "description")
  	assert c.invalid?
  	assert_not c.save
  end

  test "should update category" do
  	c = Admin::Category.first
  	assert c.update_attributes(name: "nazwa", description: "description1")
  end

  test "should destroy" do
  	c = Admin::Category.create(name: "inna nazwa", description: "description2")
  	count = Admin::Category.all.count
  	assert c.destroy
  	assert_equal count, Admin::Category.all.count + 1
  end
end
