local raindrops = {}

local sounds = {
  [3] = 'Pling',
  [5] = 'Plang',
  [7] = 'Plong'
  }

function raindrops(num)
  local result = ''
  for factor, sound in pairs(sounds) do
    if num % factor == 0 then
      result = sound .. result
    end
  end
  if result == '' then
    return result .. num
  else
    return result
  end
end

return raindrops
