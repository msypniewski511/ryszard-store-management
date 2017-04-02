class Calendar < ApplicationRecord
  


  # Save expire period date into string
  def save_expiry_date_period(month, year, day, product_id, part_number)

  	# First we check if the date is already in the table
  	if(Calendar.where(year: year, month: month).blank?)
  	  c = Calendar.new(year: year, month: month)
  	  c.info = get_info(day, product_id, part_number)
  	  c.save
  	else
  	  c = Calendar.where(month: month, year: year)
  	  string = c.info
  	  c.info = get_info(day, product_id, part_number, string)
  	  c.info.save
  	end
  end

  def get_info(day, product_id, part_number, info)
  	string = info
  	string = string + day.to_s + ":" + product_id.to_s + ":" + part_number.to_s + "-"
  end
end
