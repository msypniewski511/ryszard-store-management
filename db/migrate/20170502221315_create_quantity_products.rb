class CreateQuantityProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :quantity_products do |t|
      t.integer :quantyty
      t.integer :part_number

      t.timestamps
    end
  end
end
