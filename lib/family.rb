class Family
  
  def initialize
    @rate = Rate.new
  end
  
  def rate(time)
    @rate.for_hour(time)
  end

end