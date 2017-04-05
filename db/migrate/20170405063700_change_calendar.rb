class ChangeCalendar < ActiveRecord::Migration[5.0]
  def change
  	rename_column :calendars, :expire_date_id, :expiry_date_id
  	#add_reference :calendars, :expiry_date, foreign_key: true
  end
end
