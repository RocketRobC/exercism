class School
  def initialize
    @list = {}
  end

  def add(*students, grade)
    students.each { |s| @list[s] = grade }
  end

  def students(grade)
    return [] if @list.empty?
    @list.select { |_s, g| g == grade }.keys.sort
  end

  def students_by_grade
    return [] if @list.empty?
    class_list = @list.group_by { |_s, g| g }.map do |g, s|
      { grade: g, students: s.map { |student| student[0] }.sort }
    end
    class_list.sort_by { |grade| grade[:grade] }
  end
end

module BookKeeping
  VERSION = 3
end
