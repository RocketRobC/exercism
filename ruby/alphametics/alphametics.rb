class Alphametics
  def self.solve(input)
    new(input).solve
  end
  
  def initialize(input)
    @input = input
    @letter_list = @input.tr(' ', '').tr('+', '').tr('==', '').chars.uniq
  end

  def solve
    @letter_list.size >=3 && find_values || {}
  end

  private

  def find_values
    value_gen(@letter_list.size).each do |test_values|
      input = @input
      test_values.each do |l, n|
        input = input.tr(l, test_values[l].to_s)
      end
      summands_list, sum = split_operation(input)
      current_sum = summands_list.map(&:to_i).sum
      return test_values if current_sum == sum.to_i && valid?(summands_list << sum)
    end
  end

  def split_operation(input)
    summands, sum = input.split('==').map { |c| c.tr(' ', '') }
    [summands.split('+'), sum]
  end

  def value_gen(len)
    return enum_for(:value_gen, len) unless block_given?
    arr = [1] + (0...(len - 1)).to_a
    while arr.size == len
      yield current_values_hash(arr) if arr.uniq == arr
      arr = (arr.join.to_i + 1).to_s.chars.map(&:to_i)
    end
  end

  def current_values_hash(number_list)
    @letter_list.zip(number_list).to_h
  end

  def valid?(str)
    return false if str.any? { |a| a[0].to_i.zero? }
    true
  end
end

module BookKeeping
  VERSION = 4
end
