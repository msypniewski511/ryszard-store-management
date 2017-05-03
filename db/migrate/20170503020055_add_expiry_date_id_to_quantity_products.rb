class AddExpiryDateIdToQuantityProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :quantity_products, :expiry_date_id, :integer
  end
end
