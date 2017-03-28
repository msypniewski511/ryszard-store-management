class AddTimeExpiryToExpiryDates < ActiveRecord::Migration[5.0]
  def change
    add_column :expiry_dates, :time_expiry, :integer
  end
end
