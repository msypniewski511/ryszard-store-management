class Admin::SubCategory < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
end
