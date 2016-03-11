class Squares
  VERSION = 2

  attr_reader :number

  def initialize(n)
    @number = n
  end

  def square_of_sum
    (0..number).reduce(:+)**2
  end

  def sum_of_squares
    (0..number).map { |n| n**2 }.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

end
