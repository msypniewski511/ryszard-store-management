class ExpiryDate < ApplicationRecord
  # After save new record should save changes to the callendar table
  #after_save :change_callendar, on: :create
  #after_destroy :destroy_calendar
  belongs_to :product, class_name: "Admin::Product"
  has_many :calendars, class_name: 'Calendar', dependent: :destroy
  validates :product_id, :count, :date_expiry, :time_expiry, presence: true

  
  def create_callendar(id)
    @expire_object = ExpiryDate.find(id)
  	puts 'Dodano expiry date'
  	c = @expire_object.calendars.new(month: get_month(@expire_object.date_expiry, @expire_object.time_expiry), year: get_year(@expire_object.date_expiry, @expire_object.time_expiry),day:  get_day(@expire_object.date_expiry, @expire_object.time_expiry), expiry: date_expiry)
    c.info = @expire_object.product_id
  	c.save
  	puts "Dodano expiry date "
  end

  def change_calendar(id, product_id)
    @expire_object = ExpiryDate.find(id)
    puts 'Zmieniono expiry date'
    c = @expire_object.calendars.update(month: get_month(@expire_object.date_expiry, @expire_object.time_expiry), year: get_year(@expire_object.date_expiry, @expire_object.time_expiry),day:  get_day(@expire_object.date_expiry, @expire_object.time_expiry),info: product_id, expiry: date_expiry)
    puts "Zmieniono expiry date "
  end

private
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
