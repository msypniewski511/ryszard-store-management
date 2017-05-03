class AddDiscountToAdminProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_products, :discount, :integer
  end
end
