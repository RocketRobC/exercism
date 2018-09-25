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
    result ? result : {}
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
          return result if result
        end
      end
      nil
    end
  end

  def result_for(solution)
    if calculated_sum(@summands, solution) == convert_to_number(@sum, solution)
      solution
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
