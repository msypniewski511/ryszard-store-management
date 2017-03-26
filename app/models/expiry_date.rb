class ExpiryDate < ApplicationRecord
  belongs_to :product, class_name: "Admin::Product"
  validates :product_id, :count, :date_expiry, presence: true
end
