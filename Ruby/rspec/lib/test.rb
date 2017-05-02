class StringCalculator
  def self.add(*arg)
    sum = 0
    raise ArgumentError, 'Too many arguments' if arg.length > 2
    arg.each{|arg| sum += arg.to_i}
    sum
  end
end

class Run
  attr_accessor :duration, :timestamp, :distance
  def initialize run_variables
    @duration = run_variables[:duration]
    @distance = run_variables[:distance]
    @timestamp = run_variables[:timestamp]
  end
end
