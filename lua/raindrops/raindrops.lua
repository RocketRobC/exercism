local raindrops = {}

local function raindrops(num)
  local result = ''
  if num % 3 == 0 then result = result .. 'Pling' end
  if num % 5 == 0 then result = result .. 'Plang' end
  if num % 7 == 0 then result = result .. 'Plong' end
  if result == '' then 
    return result .. num 
  else
    return result
  end
end

return raindrops
