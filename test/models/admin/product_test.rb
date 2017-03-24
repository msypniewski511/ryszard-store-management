require 'test_helper'

class Admin::ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "products attributes should not be empty" do
  	product = Admin::Product.new
  	assert product.invalid?
  	assert product.errors[:name].any?
  	assert product.errors[:category_id].any?
  	assert product.errors[:subcategory_id].any?
  	assert product.errors[:company_id].any?
  	assert_not product.save
  end

  test "product name should be unique" do
  	product = Admin::Product.new(name: Admin::Product.first.name, category_id: 1, subcategory_id: 1, company_id: 1)
  	assert product.invalid?
  	assert product.errors[:name].any?
  	assert_not product.save
  end

  test "product price must be positive" do
  	product = Admin::Product.new(name: "Nowa nazwa", category_id: 1, subcategory_id: 1, company_id: 1)
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater then or equal to 0.01"], product.errors[:price]

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater then or equal to 0.01"], product.errors[:price]

  	product.price = 1
  	assert product.valid?
  end

  def new_product(image_url)
  	Admin::Product.new(name: "New name", description: "Des",
  		category_id: 1, subcategory_id: 1, company_id: 1,
  		image_url: image_url,
  		price: 1)
  end
  test "image_url" do
  	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
  	bad = %w{ fred.doc fred.gif/more fred.gif.more }
  	ok.each do |name|
  	  assert new_product(name).valid?, "#{name} shouldn't be invalid"
  	end
  	bad.each do |name|
  	  assert new_product(name).invalid?, "#{name} shouldn't be valid"
  	end
  end


end
