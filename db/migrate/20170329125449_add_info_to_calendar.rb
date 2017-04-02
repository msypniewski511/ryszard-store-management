class AddInfoToCalendar < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :info, :string
  end
end
