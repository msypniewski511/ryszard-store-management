class FixColumnInProduct < ActiveRecord::Migration[5.0]
  def change
  	rename_column :admin_products, :sub_category_id, :subcategory_id
  end
end
