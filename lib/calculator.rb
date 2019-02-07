class Calculator

  attr_reader :start_time, :end_time, :family
  
  def initialize(start_time:, end_time:, family:)
    @start_time = start_time
    @end_time = end_time
    @family = family
  end

  def total_pay
    0
  end

end