class Alphametics
  def self.solve(input)
    new(input)
  end

  def initialize(input)
    @input = input
    solve_for(value_map(number_list([1], 1)), 0)
  end

  def solve_for(value_map, inc)
    current_numbers = number_list(value_map.values, 1)
    mapped_values = assign_values(current_numbers, @input)
    summands_list, sum = split_operation(mapped_values)
    current_sum = summands_list.map(&:to_i).reduce(:+)
    return value_map(current_numbers) if current_sum == sum.to_i
    inc += 1
    solve_for(number_list(value_map.values, inc), inc)
  end

  def assign_values(numbers, input)
    hash = value_map(numbers)
    hash.each do |l, n|
      input = input.tr(l, hash[l].to_s)
    end
    input
  end

  def value_map(numbers)
    letter_list.zip(numbers).to_h
  end

  def letter_list
    @input.tr(' ', '').tr('+', '').tr('==', '').chars.uniq
  end

  def number_list(current, inc)
    arr = (current.join.to_i + inc).to_s.chars.map(&:to_i)
    padded_arr = arr.unshift(0 * (letter_list.size - arr.size))
    arr.uniq == arr ? padded_arr : number_list(current, 2)
  end

  def split_operation(input)
    summands, sum = input.split('==').map { |c| c.tr(' ', '') }
    [summands.split('+'), sum]
  end
end
