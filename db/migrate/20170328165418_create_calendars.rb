class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.string :month
      t.integer :year

      t.timestamps
    end
  end
end
