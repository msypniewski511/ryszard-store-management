require 'test_helper'

class Admin::CompanyTest < ActiveSupport::TestCase

  def setup
  	@company = Admin::Company.create(name: "nazwa", description: "description")
  end
  test "category should be not empty name" do
  	company = Admin::Company.new(name: "", description: "description")
  	assert company.invalid?, "empty name give invalid record"
  	assert company.errors[:name].any?
  	assert_not company.save
  end

  test "name sttribute should be unique" do
  	c = Admin::Company.new(name: @company.name, description: "description")
  	assert c.invalid?
  	assert_not c.save
  end

  test "should update category" do
  	c = Admin::Company.first
  	assert c.update_attributes(name: "nazwa", description: "description1")
  end

  test "should destroy" do
  	c = Admin::Company.create(name: "inna nazwa", description: "description2")
  	count = Admin::Company.all.count
  	assert c.destroy
  	assert_equal count, Admin::Company.all.count + 1
  end
end
