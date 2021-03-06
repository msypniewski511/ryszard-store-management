class Admin::Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
  has_many :subcategories, class_name: 'Admin::SubCategory', dependent: :destroy
  has_many :products, class_name: "Admin::Product", dependent: :destroy
end
