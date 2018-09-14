require 'io/console'

class Alphametics
  def self.solve(input)
    new(input).solve
  end
  
  def initialize(input)
    @input = input
    @summands, @sum = split_operation
    @letter_list = (@summands + @sum).tr('+', '').chars.uniq
  end

  def solve
    return {} if @letter_list.size < 3
    value_gen(@letter_list.size).each do |test_values|
      summand_str = @summands
      sum = @sum
      test_values.each do |l, n|
        replacement = test_values[l]
        summand_str = summand_str.tr(l, replacement.to_s)
        sum = sum.tr(l, replacement.to_s)
      end
      current_sum = summand_str.split('+').map(&:to_i).reduce(:+)
      # TODO: Fix validation for test 4
      if current_sum == sum.to_i && valid_sum?(summand_str)
        test_values
      else
        {}
      end
    end
  end

  private

  def split_operation
    @input.split('==').map { |c| c.tr(' ', '') }
  end

  def value_gen(len)
    return enum_for(:value_gen, len) unless block_given?
    arr = (0...len).to_a
    while arr.size == len
      yield current_values_hash(arr) if arr.uniq == arr
      arr = (arr.join('').to_i + 1).to_s.chars.map { |c| c.to_i }
      arr.size < len ? arr.unshift(0 * (len - arr.size)) : arr
    end
  end

  def current_values_hash(number_list)
    @letter_list.zip(number_list).to_h
  end

  def valid_sum?(summand_str)
    return false if summand_str.split('+').any? { |a| a[0].to_i.zero? }
    true
  end
end

module BookKeeping
  VERSION = 4
end
