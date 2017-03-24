class Admin::SubCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
  belongs_to :category, class_name: "Admin::Category"
  has_many :products, class_name: "Admin::Product"
end
