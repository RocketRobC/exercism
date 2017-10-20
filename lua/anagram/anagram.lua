Anagram = {}
Anagram.__index = Anagram

local function letters_for(word)
  local letters = {}
  for l in word:gmatch('.') do
    table.insert(letters, l)
  end
  table.sort(letters)
  return table.concat(letters, '')
end
  
function Anagram:new(word)
  local anagram = {}
  setmetatable(anagram, Anagram)
  self.input = letters_for(word:lower())
  return anagram
end

function Anagram:match(list)
  local result = {}
  for _, word in ipairs(list) do
    if letters_for(word:lower()) == self.input then
      table.insert(result, word)
    end
  end
  return result
end

return Anagram
