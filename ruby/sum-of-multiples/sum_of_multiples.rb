class SumOfMultiples
  def initialize(*n)
    @factors = n
  end

  def to(limit)
    return 0 if limit == 1
    @factors.map do |f|
      (1...limit).each_with_object([]) do |r, result|
        result << ((r % f).zero? ? r : 0)
      end
    end.flatten.uniq.reduce(:+)
  end
end
