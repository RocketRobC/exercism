@letter_list = %w[a s d f]

def next_number(current, inc)
  next_number_list = next_number_arr(current, inc)
  return next_number_list if next_number_list.uniq == next_number_list
  next_number(next_number_list, 1)
end

def next_number_arr(current, inc)
  arr = (current.join.to_i + inc).to_s.chars.map(&:to_i)
  arr.unshift(0 * (@letter_list.size - arr.size))
end

p next_number([0,1,9,8], 1)
