class Admin::Company < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
  has_many :products, class_name: "Admin::Product"
end
