class Series
  def initialize(value)
    @value = value
    @vsize = value.size
  end

  def slices(len)
    raise ArgumentError if len > @vsize
    range = @vsize - len
    (0..range).each_with_object([]) do |i, result|
      result << @value.slice(i, len)
    end
  end
end
