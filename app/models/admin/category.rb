class Admin::Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
  has_many :subcategories, class_name: 'Admin::SubCategory', dependent: :destroy
end
