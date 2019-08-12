class Counter
  attr_accessor :cnt
  
  def initialize
    @cnt=0
  end
  
  def fib(n)
    self.cnt += 1
    puts "called fib(#{n}), call count is #{cnt}"
    return n if n <= 1
    fib(n-1)+fib(n-2)
  end
end

f = Counter.new

fib5 = f.fib(5)

puts "#{fib5}; #{f.cnt}"