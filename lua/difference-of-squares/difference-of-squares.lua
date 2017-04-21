local diff = {}

function diff.square_of_sums(n)
  local result = 0
  for i = 1, n do
    result = result + i
  end
  return result ^ 2
end

function diff.sum_of_squares(n)
  local result = 0
  for i = 1, n do
    result = result + i ^ 2
  end
  return result
end

function diff.difference_of_squares(n)
  return diff.square_of_sums(n) - diff.sum_of_squares(n)
end

return diff
