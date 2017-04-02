class AddDayToCalendar < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :day, :integer
  end
end
