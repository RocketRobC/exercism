class PrimeFactors
  def self.for(n)
    return [] if n == 1
    factor = (2..n).find { |i| (n % i).zero? }
    [factor] + self.for(n / factor)
  end
end

