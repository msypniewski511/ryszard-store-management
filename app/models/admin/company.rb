class Admin::Company < ApplicationRecord
  validates :name, presence: true, uniqueness: {on: :create}
end
