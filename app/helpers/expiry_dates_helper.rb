module ExpiryDatesHelper
def data_month(month)
    case (month)
      when 1
          "Styczeń"
      when 2
          "Luty"
      when 3
          "Marzec"
      when 4
          "Kwiecień"
      when 5
          "Maj"
      when 6
          "Czerwiec"
      when 7
          "Lipiec"
      when 8
          "Sierpień"
      when 9
          "Wrzesień"
      when 10
          "Październik"
      when 11
          "Listopad"
      when 12
          "Grudzień"
      end
  end
  
  def tablica_miesiaca(time)
      tab = Array.new
      tmp = time.months_ago(1).end_of_month.day
      tmp_2 = ile_dni_poprzedniego_miesiaca(time.beginning_of_month.wday)
      tmp_2.times do |n|
          tab << (tmp - (tmp_2 - (n + 1))).to_s + "|prev-month"
      end
      (1..time.end_of_month.day).to_a.each do |n|
          tab << n.to_s
      end
      ile_dni_nastepnego_miesiaca(time.end_of_month.wday).times do |n|
          tab << (n + 1).to_s + "|next-month"
      end
      return tab
  end
  
  def ile_dni_poprzedniego_miesiaca(day_of_week)
      if day_of_week == 0
          7
      else
          day_of_week
      end
  end
  
  def ile_dni_nastepnego_miesiaca(day_of_week)
      return 7 - day_of_week
  end
end
