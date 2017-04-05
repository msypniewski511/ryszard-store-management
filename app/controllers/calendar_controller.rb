class CalendarController < ApplicationController
  before_action :set_time, only: [:show, :index]
  def index
  begin
    @points = []
    @moja = session[:month_number]
    @month = @time_now.month
    @year = @time_now.year 
    @cal = Calendar.find_by_year_and_month(@year, @month)
    unless @cal.blank? then
      @date = @cal.expiry_date.date_expiry
      #date_expiry = Date.new()
      @date_to_show = ExpiryDate.where(date_expiry: @date.beginning_of_month..@date.end_of_month)
    end
  rescue ActiveRecord::RecordNotFound
    @points = []
    @moja = session[:month_number]
    @month = @time_now.month
    @year = @time_now.year
  end
  end

  def show
  	@moja = session[:month_number]
  	@month = @time_now.month
  	@year = @time_now.year
    #@date_to_show = ExpiryDate.where(year: @year, month: @month)
  end

  private

  # Set time based on session information about user choose
  def set_time
  	time = Time.now
  	set_session
    if session[:month_number] then
      if(session[:month_number] < 0) then
        @time_now = time.months_ago(-(session[:month_number]))
      elsif (session[:month_number] > 0) then
        @time_now = time.months_since(session[:month_number])
      # if session is not yet set time is actual time
      else
        @time_now = time
      end
    end
  end

  # Set session's variable used to change time in callendar month. 
  def set_session
    if !session[:month_number] then
      session[:month_number] = 0
    end
  	if session[:month_number] then
  	  if(params[:month] == "prev") then
  	    session[:month_number] -= 1
  	  elsif(params[:month] == "next") then
  	    session[:month_number] += 1
  	  else
  	  	session[:month_number] = 0
  	  end
  	end
  end

  def get_month_info
  end
end
