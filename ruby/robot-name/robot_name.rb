class Robot

  def initialize
    name
  end

  def name
    @current_name ||= set_name
  end

  def set_name
    (rand_alpha << rand_num).join
  end

  def rand_alpha
    2.times.map { (65 + rand(26)).chr }
  end

  def rand_num
    3.times.map { 1 + rand(9) }
  end

  def reset
    @current_name = Robot.new.name
  end

end
