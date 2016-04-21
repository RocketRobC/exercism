class Prime

  def nth(n)
    input_error?(n)
    primes_to_n(n)
    result.last
  end

  def primes_to_n(n)
    r = 2
    until result.size == n do
      prime(r)
      r += 1
    end
  end

  def prime(r)
    s = (0..r).to_a
    s[0] = s[1] = nil
    s.each do |v|
      next unless v
      break if v*v > r
      (v*v).step(r, v) { |i| s[i] = nil }
    end
    @result = s.compact
  end

  def result
    @result ||= [2]
  end

  def input_error?(n)
    raise ArgumentError if n <= 0
  end

end
