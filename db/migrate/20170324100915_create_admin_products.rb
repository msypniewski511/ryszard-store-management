class CreateAdminProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_products do |t|
      t.string :name, null: false, unique: true, index: true
      t.text :description
      t.integer :category_id, null: false, foreign_key: true
      t.integer :subcategory_id, null: false, foreign_key: true
      t.integer :company_id, null: false, foreign_key: true
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
