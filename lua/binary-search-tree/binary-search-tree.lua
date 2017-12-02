BinarySearchTree = {}

function BinarySearchTree:new(value)
  local tree = {}
  setmetatable(tree, self)
  self.__index = self
  tree.value = value
  return tree
end

function BinarySearchTree:insert(input_value)
  local branch = input_value <= self.value and 'left' or 'right'
  if self[branch] then 
    self[branch]:insert(input_value) 
  else 
    self[branch] = BinarySearchTree:new(input_value) 
  end
  return self
end

function BinarySearchTree:from_list(list)
  assert(#list > 0)
  local tree = BinarySearchTree:new(list[1])
  for i = 2, #list do
    tree:insert(list[i])
  end
  return tree
end

function BinarySearchTree:values()
  return coroutine.wrap(function()
    if self.left then 
      for v in self.left:values() do 
        coroutine.yield(v) 
      end 
    end
    coroutine.yield(self.value)
    if self.right then 
      for v in self.right:values() do 
        coroutine.yield(v) 
      end 
    end
  end)
end

return BinarySearchTree
