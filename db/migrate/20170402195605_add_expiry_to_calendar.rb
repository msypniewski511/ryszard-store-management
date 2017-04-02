class AddExpiryToCalendar < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :expiry, :date
  end
end
