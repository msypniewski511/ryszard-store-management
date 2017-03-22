class Admin::Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
end
