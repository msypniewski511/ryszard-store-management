class AddPictureToAdminProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_products, :picture, :string
  end
end
