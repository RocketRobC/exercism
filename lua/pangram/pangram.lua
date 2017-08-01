return function(phrase)
  local alphabet = 'abcdefghijklmnopqrstuvwxyz'
  local p = phrase:gsub('%W', ''):lower()
  for l in alphabet:gmatch('%l') do
    if not p:match(l) then return false end
  end
  return true
end

    
