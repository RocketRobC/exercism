#class PrimeFactors
#  def self.for(n)
#    return [] if n == 1
#    (2..n).each_with_object([]) do |i, result|
#      until n % i == 1
#        n /= i
#        result << i
#      end
#    end
#  end
#end

#class PrimeFactors
#  def self.for(n)
#    return [] if n == 1
#    (2..n).each_with_object([]) do |i, result|
#      while (n % i).zero?
#        result << i
#        n /= i
#      end
#    end
#  end
#end

#class PrimeFactors
#  def self.for(number)
#    prime_factors = []
#    (2..number).each do |potential|
#      while factor?(potential, number)
#        prime_factors << potential
#        number /= potential
#      end
#    end
#    prime_factors
#  end
#
#  def self.factor?(potential, number)
#    (number % potential).zero?
#  end
#end
#class PrimeFactors
#  def self.for(number)
#    return [] if number < 2
#    divisor = (2..number - 1).detect { |div| number % div == 0 }
#    divisor ? ([divisor] + self.for(number / divisor)) : [number]
#  end
#end
#class PrimeFactors
#  def self.for(n)
#    result = []
#    i = 2
#    until n == 1
#      if (n % i).zero?
#        n /= i
#        result << i
#      else
#        i += 1
#      end
#    end
#    result
#  end
#end

class PrimeFactors
  def self.for(n)
    result = []
    factor = (2..n).find { |i| (n % i).zero? }
    if factor
      result << self.for(n / factor)
    end
  end
end

#require 'prime'
#class PrimeFactors
#  def self.for(number)
#    prime_factors = Prime.take(Math.sqrt(number + 1))
#    a = []
#    prime_factors.each do |p|
#      while number % p == 0
#        a.push(p)
#        number /= p
#      end
#    end
#    a
#  end
#end
#class PrimeFactors
#  def self.for(n)
#    factors = []
#    divisor = 2
#    until n == 1 do
#      if n % divisor == 0
#        factors << divisor
#        n /= divisor
#      else
#        divisor += 1
#      end
#    end
#    factors
#  end
#end
