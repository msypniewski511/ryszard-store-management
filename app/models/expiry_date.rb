class ExpiryDate < ApplicationRecord
  # After save new record should save changes to the callendar table
  after_save :change_callendar
  #after_destroy :destroy_calendar
  belongs_to :product, class_name: "Admin::Product"
  has_many :calendars, class_name: 'Calendar', dependent: :destroy
  validates :product_id, :count, :date_expiry, :time_expiry, presence: true

  private
  def change_callendar
  	puts 'Dodano expiry date'
  	c = ExpiryDate.last.calendars.new(month: get_month(ExpiryDate.last.date_expiry, ExpiryDate.last.time_expiry), year: get_year(ExpiryDate.last.date_expiry, ExpiryDate.last.time_expiry),day:  get_day(ExpiryDate.last.date_expiry, ExpiryDate.last.time_expiry), info: "", expiry: date_expiry)
    c.info = ExpiryDate.last.product_id
  	c.save
  	puts "Dodano expiry date "
  end

  def destroy_calendar

  end

  def get_month(date_expiry, time_expiry)
  	month = (date_expiry.days_ago(time_expiry)).month
  end
  def get_year(date_expiry, time_expiry)
  	year = (date_expiry.days_ago(time_expiry)).year
  end
  def get_day(date_expiry, time_expiry)
  	day = (date_expiry.days_ago(time_expiry)).day
  end
end
