class Trinary
  def initialize(trinary_number)
    @trinary_reverse = trinary_number.reverse
  end

  def to_decimal
    return 0 unless @trinary_reverse.chars.all? { |c| c =~ /[0-2]/ }
    @trinary_reverse.chars.map.with_index { |n, i| n.to_i * 3**i }.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
