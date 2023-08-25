class FibonacciService
  attr_reader :value
  attr_accessor :runtime, :start_time, :end_time


  def initialize(value)
    @value = value
  end

  def call
    @start_time = Time.now
    result = find_nth_fibonacci_number
    @end_time   = Time.now

    { value: value, result: result, runtime: calculate_runtime }
  end

  def calculate_runtime
    (end_time - start_time) * 1000
  end

  def find_nth_fibonacci_number
    return value if value <= 1

    fib = [0, 1]
    (2..value).each do |i|
      fib[i] = fib[i - 1] + fib[i - 2]
    end
    fib[value]
  end

end