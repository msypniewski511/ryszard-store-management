class Admin::SubCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
  belongs_to :category,class_name: "Admin::Category"
end
