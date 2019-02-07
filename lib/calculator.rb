class Calculator

  attr_reader :start_time, :end_time, :family
  
  def initialize(start_time:, end_time:, family:)
    @start_time = start_time
    @end_time = end_time
    @family = family
  end

  def total_pay
    family.rate * hours_of_work
  end

  private

  def hours_of_work
    ((end_time - start_time) / 3600).to_i
  end

end