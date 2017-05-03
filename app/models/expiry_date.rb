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

  # count products with in_period status
  def self.count_in_period
    count = 0
    ExpiryDate.all.each do |e|
      if e.check_status == 'in_period' then
        count = count + 1
      end
    end
    return count
  end

  # count products with after_period status
  def self.count_after_period
    count = 0
    ExpiryDate.all.each do |e|
      if e.check_status == 'after_period' then
        count = count + 1
      end
    end
    return count
  end

  # Check the current product is present in its expiry period or behind id. 
  def check_status
    # beggining of expiry perriod
    day_beggining_expiry = self.date_expiry - self.time_expiry.days
    if Time.now >= day_beggining_expiry && Time.now <= self.date_expiry
      return 'in_period'
    elsif Time.now >= self.date_expiry
      return 'after_period'
    end
    return 'normal'

  end

private

  def destroy_calendar

  end

  def self.get_products_in_period
    tab = []
    ExpiryDate.all.each do |e|
      if e.check_status == 'in_period' then
        tab << e
      end
    end
    return tab
  end

    def self.get_products_after_period
    tab = []
    ExpiryDate.all.each do |e|
      if e.check_status == 'after_period' then
        tab << e
      end
    end
    return tab
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
