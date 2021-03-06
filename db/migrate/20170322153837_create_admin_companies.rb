class CreateAdminCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_companies do |t|
      t.string :name, unique: true, null: false, index: true
      t.string :description
      t.timestamps
    end
  end
end
