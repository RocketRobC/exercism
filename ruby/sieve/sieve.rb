class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    s = (0..@n).to_a
    s[0] = s[1] = nil
    s.each do |v|
      next unless v
      break if v * v > @n
      (v * v).step(@n, v) { |i| s[i] = nil }
    end
    s.compact
  end
end
