class Family

  def rate(hour_worked)
    if hour_worked.hour >= 23 || hour_worked.hour <= 4 # after 11:00PM or before 4:00AM
      20
    else
      15
    end
  end

end