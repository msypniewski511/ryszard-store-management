class AddExpiryDateIdToCalendar < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :expire_date_id, :integer
  end
end
