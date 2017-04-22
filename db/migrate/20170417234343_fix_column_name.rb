class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :admin_products, :subcategory_id, :sub_category_id
  end
end
