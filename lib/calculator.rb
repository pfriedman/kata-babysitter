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

  def hours_of_work
    ((end_time - start_time) / 3600).ceil.to_i
  end
  private :hours_of_work

end