class Admin::Product < ApplicationRecord
  belongs_to :company, class_name: "Admin::Company"
  belongs_to :category, class_name: "Admin::Category"
  belongs_to :subcategory, class_name: "Admin::SubCategory"
  validates :name, :company_id, :category_id, :subcategory_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
