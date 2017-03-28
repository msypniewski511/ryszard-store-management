class ExpiryDate < ApplicationRecord
  # After save new record should save changes to the callendar table
  after_save :change_callendar
  belongs_to :product, class_name: "Admin::Product"
  validates :product_id, :count, :date_expiry, :time_expiry, presence: true

  private
  def change_callendar
  	puts 'Dodano expiry date'
  end
end
