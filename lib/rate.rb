class Rate

  def initialize(type = "A")
    @rate = Object.const_get("Rate#{type}").new
  end

  def for_hour(time)
    @rate.for_hour(time)
  end
end

# A pays $15 per hour before 11pm, and $20 per hour the rest of the night
class RateA

  def for_hour(time)
    hour = time.hour
    if hour >= 23 || hour <= 4
      20
    else
      15
    end
  end

end

# B pays $12 per hour before 10pm, $8 between 10 and 12, and $16 the rest of the night
class RateB

  def for_hour(time)
    hour = time.hour
    if hour >= 22 && hour <= 23
      8
    elsif hour >= 23 || hour <= 4
      16
    else
      12
    end
  end

end