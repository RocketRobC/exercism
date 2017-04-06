local hamming = {}

function hamming.compute(str1, str2)
  local diff_count = 0
  if #str1 ~= #str2 then return -1 end
  for i = 1, #str1 do
    if str1:sub(i,i) ~= str2:sub(i,i) then
      diff_count = diff_count + 1
    end
  end
  return diff_count
end

return hamming
