class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, class_name: "Admin::Product"
end
