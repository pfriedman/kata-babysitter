class Calculator

  class EndTimeBeforeStartTimeError < StandardError; end
  class OutsideAllowableWorkHoursError < StandardError; end

  HOUR = 3600

  attr_reader :start_time, :end_time, :rate
  
  def initialize(start_time:, end_time:, rate:)
    @start_time = start_time
    @end_time = end_time
    @rate = rate
    validate!
  end

  def total_pay
    pay = 0
    hours_of_work.times do |i|
      pay += rate.for_hour(hour_worked(i))
    end
    pay
  end

  private

  def hours_of_work
    ((end_time - start_time) / HOUR).ceil.to_i
  end

  def hour_worked(increment)
    start_time + (HOUR * increment)
  end

  def validate!
    raise EndTimeBeforeStartTimeError if end_time < start_time
    raise OutsideAllowableWorkHoursError if end_time_is_too_late? || start_time_is_too_early?
  end

  def end_time_is_too_late?
    end_time > max_end_time
  end

  def start_time_is_too_early?
    start_time < min_start_time
  end

  def max_end_time
    Time.parse("#{start_time.year}-#{start_time.month}-#{start_time.day + 1} 4:00AM")
  end

  def min_start_time
    Time.parse("#{start_time.year}-#{start_time.month}-#{start_time.day} 5:00PM")
  end

end