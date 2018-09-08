class Alphametics
  def self.solve(input)
    new(input).solve
  end
  
  def initialize(input)
    @input = input
    summands, @sum = split_operation
  end

  def solve
    
  end

  private

  def split_operation
    @input.split('==').map { |c| c.tr(' ', '') }
  end
end

module BookKeeping
  VERSION = 4
end
