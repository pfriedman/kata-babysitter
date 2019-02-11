class Calculator

  HOUR = 3600

  attr_reader :start_time, :end_time, :rate
  
  def initialize(start_time:, end_time:, rate:)
    @start_time = start_time
    @end_time = end_time
    @rate = rate
  end

  def total_pay
    pay = 0
    hours_of_work.times do |i|
      pay += rate.for_hour(hour_worked(i))
    end
    pay
  end

  def hours_of_work
    ((end_time - start_time) / HOUR).ceil.to_i
  end
  private :hours_of_work

  def hour_worked(increment)
    start_time + (HOUR * increment)
  end
  private :hour_worked

end