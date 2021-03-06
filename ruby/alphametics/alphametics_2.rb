class Maybe
  def self.none
    new
  end

  def self.some(val)
    new(val)
  end

  attr_reader :val

  def initialize(val = nil)
    @val = val
  end

  def some?
    !@val.nil?
  end
end

class Alphametics
  def self.solve(input)
    new(input).solve
  end

  def initialize(input)
    @input = input
    @letters = @input.tr(' ', '').tr('+', '').tr('==', '').chars.uniq
    @summands, @sum = split_equation(@input)
  end

  def solve
    result = solve_for(@letters)
    if result.some?
      result.val
    else
      {}
    end
  end

  private

  def solve_for(letters, solution = {})
    if letters.empty?
      result_for(solution)
    else
      head = letters[0]
      tail = letters[1..-1]
      (0..9).each do |n|
        unless solution.values.include?(n)
          result = solve_for(tail, solution.merge({ head => n }))
          if result.some?
            return result
          end
        end
      end
      Maybe.none
    end
  end

  def result_for(solution)
    if calculated_sum(@summands, solution) == convert_to_number(@sum, solution)
      Maybe.some(solution)
    else
      Maybe.none
    end
  end

  def calculated_sum(values, solution)
    values.map { |v| convert_to_number(v, solution) }.sum
  end

  def convert_to_number(letters, solution)
    numbers = letters.map { |l| solution[l] }
    return 0 if numbers[0].zero?
    numbers.join.to_i
  end

  def split_equation(input)
    summands, sum = input.split('==').map { |c| c.tr(' ', '') }
    [summands.split('+').map(&:chars), sum.chars]
  end
end

module BookKeeping
  VERSION = 4
end
