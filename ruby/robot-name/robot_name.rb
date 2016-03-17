class Robot

  attr_reader :name

  def initialize
    @name = rand_alpha << rand_num
  end

  def rand_alpha
    2.times.map { (65 + rand(26)).chr }.join
  end

  def rand_num
    3.times.map { 1 + rand(9) }.join
  end

  def reset
    initialize
  end

end
