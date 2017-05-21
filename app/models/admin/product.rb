class Admin::Product < ApplicationRecord
  has_many :expiry_dates, class_name: "ExpiryDate", dependent: :destroy
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :company, class_name: "Admin::Company"
  belongs_to :category, class_name: "Admin::Category"
  belongs_to :subcategory, class_name: 'Admin::SubCategory', :foreign_key => "subcategory_id"


  mount_uploader :picture, PictureUploader
  
  # Paperclip
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  validates :name, :company_id, :category_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: { with: %r{\.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
  acts_as_ferret :fields => [:name]
  validate :picture_size

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end 
    def self.count
      Admin::Product.all.size
    end

    def self.latest
      Admin::Product.last(5)
    end
end
