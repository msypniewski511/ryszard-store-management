class Admin::Product < ApplicationRecord
  has_many :expiry_dates, class_name: "ExpiryDate", dependent: :destroy
  belongs_to :company, class_name: "Admin::Company"
  belongs_to :category, class_name: "Admin::Category"
  belongs_to :subcategory, class_name: 'Admin::SubCategory', :foreign_key => "subcategory_id"

  # Paperclip
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  validates :name, :company_id, :category_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
  acts_as_ferret :fields => [:name]

  def self.count
    Admin::Product.all.size
  end
end
