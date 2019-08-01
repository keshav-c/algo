require 'set'

class PrimeChecker
  attr_reader :primes

  def initialize(limit=10000)
    @primes = Set.new(sieve_of_erastothenes(limit))
  end

  def number_of_primes(array)
    array.count { |el| primes.include? el }
  end

  def prime_prime(array)
    num_mults = Hash.new(0)
    max_mults = 0
    result = "Error"
    primes.each do |prime|
      if array.all? { |el| el < prime }
        break
      else
        num_mults[prime] = array.count { |el| el % prime == 0 }
        if num_mults[prime] > max_mults
          max_mults = num_mults[prime]
          result = prime
        end
      end
    end
    result
  end

  def sieve_of_erastothenes(limit)
    is_prime = Array.new(limit, true)
    primes = []
    is_prime[0] = false
    is_prime[1] = false
    (2..limit).each do |num|
      if is_prime[num]
        primes << num
        multiplier = 2
        while num * multiplier <= limit
          is_prime[num * multiplier] = false
          multiplier += 1
        end
      end
    end
    primes
  end
end