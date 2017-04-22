class AddAttachmentImageToAdminProducts < ActiveRecord::Migration
  def self.up
    change_table :admin_products do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :admin_products, :image
  end
end