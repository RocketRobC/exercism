class School
  def initialize
    @list = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(students, grade)
    @list[grade] << students
  end

  def students(grade)
    @list[grade].sort
  end

  def students_by_grade
    @list.keys.sort.map do |grade|
      { grade: grade, students: students(grade) }
    end
  end
end

module BookKeeping
  VERSION = 3
end
