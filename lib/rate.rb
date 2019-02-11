class Rate

  def for_hour(time)
    if time.hour >= 23 || time.hour <= 4 # after 11:00PM or before 4:00AM
      20
    else
      15
    end
  end

end