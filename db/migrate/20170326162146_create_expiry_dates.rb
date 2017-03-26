class CreateExpiryDates < ActiveRecord::Migration[5.0]
  def change
    create_table :expiry_dates do |t|
      t.integer :product_id, null: false, index: true
      t.integer :part_number
      t.integer :count, null: false
      t.datetime :date_added
      t.datetime :date_expiry, null: false

      t.timestamps
    end
  end
end
