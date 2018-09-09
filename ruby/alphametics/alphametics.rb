class Alphametics
  def self.solve(input)
    new(input).solve
  end
  
  def initialize(input)
    @input = input
    @summands, @sum = split_operation
    @letter_list = @summands.tr('+', '').chars.uniq
    # @value_map = current_values
    @number_selector = SelectedNumber.new(@letter_list)
  end

  # need to map the @sum to numbers.
  def solve
    sum_str = @summands
    @letter_list.each do |l|
      sum_str = sum_str.tr(l, @number_selector.choose_for(l).to_s)
    end
    puts sum_str.split('+').map(&:to_i)
    current_sum = sum_str.split('+').map(&:to_i).reduce(:+)
    return current_sum if current_sum == @sum.to_i
  end

  private

  def map_to_number(str)
  end

  def split_operation
    @input.split('==').map { |c| c.tr(' ', '') }
  end

  def current_values
    @letter_list.each_with_object({}) do |l|
      hash[l] = SelectedNumber.new(@letter_list)
    end
  end

  class SelectedNumber
    def initialize(letters)
      @letter_values = letters.each_with_object({}) { |l, hash| hash[l] = (0..9).to_a }
    end
      
    def choose_for(letter)
      return if @letter_values[letter].empty?
      chosen = @letter_values[letter].sample
      @letter_values[letter].delete(chosen)
      chosen
    end
  end
end

module BookKeeping
  VERSION = 4
end

o = Alphametics::SelectedNumber.new(%w[N O T])
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "N: #{o.choose_for('N')}"
puts "O: #{o.choose_for('O')}"
puts "O: #{o.choose_for('O')}"
puts "O: #{o.choose_for('O')}"
puts "O: #{o.choose_for('O')}"
puts "T: #{o.choose_for('T')}"
puts "T: #{o.choose_for('T')}"
puts "T: #{o.choose_for('T')}"
puts "T: #{o.choose_for('T')}"
puts "T: #{o.choose_for('T')}"
puts "T: #{o.choose_for('T')}"
