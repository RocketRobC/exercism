local bob = {}

function bob.hey(remark)
  local response = ''
  if remark == remark:upper() and remark ~= remark:lower() then
    response = 'Whoa, chill out!'
  elseif remark:match("?$") then
    response = 'Sure'
  elseif not remark:match('%s') then
    response = 'Fine, be that way.' 
  else
    response = 'Whatever'
  end
  return response
end

return bob
