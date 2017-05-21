class Cart < ApplicationRecord
	has_many :cart_items
	has_many :products, class_name: 'Admin::Product', through: :cart_items

  def total
  	cart_items.inject(0) {|sum, n| n.price * n.amount + sum}
  end

  def add(product_id)
  	items = cart_items.find_by(product_id: product_id)
  	product = Admin::Product.find(product_id)

  	# If there is no given product a new item will be create
  	if items.blank?
  	  ci = cart_items.create(product_id: product_id, amount: 1, price: product.price)
    # otherwise we increment particular amount of cart_items for product
  	else
  	  ci = items
  	  ci.update_attribute(:amount, ci.amount + 1)
  	end
  	ci = CartItem.all
  end

  def remove(product_id)

    ci = cart_items.find_by_product_id(product_id)

    if ci.amount > 1
      ci.update_attribute(:amount, ci.amount - 1)
    else
      CartItem.destroy(ci.id)
    end
    return ci
  end
end
