function prime_factors(n, result)
  local result = result or {}
  if n == 1 then return result end
  for i = 2, n do
    if n % i == 0 then
      table.insert(result, i)
      prime_factors(n / i, result)
      return result
    end
  end
end

return prime_factors
