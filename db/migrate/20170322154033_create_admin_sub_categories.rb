class CreateAdminSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_sub_categories do |t|
      t.string :name, null: false, index: true
      t.string :description
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
