class PrimeFactors
  def self.for(n)
    return [] if n == 1
    primes(n).each_with_object([]) do |i, result|
      until n % i == 1
        n /= i
        result << i
      end
    end
  end

  def self.primes(n)
    s = (0..n).to_a
    s[0] = s[1] = nil
    s.each do |v|
      next unless v
      break if v * v > n
      (v * v).step(n, v) { |i| s[i] = nil }
    end
    s.compact
  end
end
