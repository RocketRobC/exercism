class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_str)
    @rows = generate_rows(matrix_str)
    @columns = generate_columns(rows)
  end

  def saddle_points
    max_of_rows.map.with_index do |row_vector, idx|
      if row_vector[:value] == min_of_columns[row_vector[:value_idx]][:value]
        [idx, row_vector[:value_idx]]
      end
    end.compact
  end

  private

  def max_of_rows
    extremum(:max, rows)
  end

  def min_of_columns
    extremum(:min, columns)
  end

  def extremum(extreme, row_or_column)
    row_or_column.map do |values|
      value = values.send(extreme)
      { value: value, value_idx: values.index(value) }
    end
  end

  def generate_rows(input)
    values_as_strings = input.split("\n").map(&:split)
    values_as_strings.map { |r| r.map(&:to_i) }
  end

  def generate_columns(rows)
    columns = []
    rows.first.size.times do |idx|
      columns << rows.map { |row| row[idx] }
    end
    columns
  end
end
