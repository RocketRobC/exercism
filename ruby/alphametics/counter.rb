def counter(arr, len)
  return if arr.size > len
  p arr if arr.uniq == arr
  counter((arr.join('').to_i + 1).to_s.chars.map { |c| c.to_i }, len)
end

# counter([0,1,2], 3)

def counter2(arr, len)
  return enum_for(:counter2, arr, len) unless block_given?
  while arr.size <= len
    yield arr if arr.uniq == arr
    arr = (arr.join('').to_i + 1).to_s.chars.map { |c| c.to_i }
    arr.size < len ? arr.unshift(0 * (len - arr.size)) : arr
  end
end

letters = %w(B I L)
counter2([0,1,2], 3) do |arr|
  p letters.zip(arr).to_h
end
puts '** TAKE **'
p counter2([0,1,2], 3).take(10)
