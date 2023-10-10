local types = require(script.Parent.types)

local function useSetStore<T>(Store: types.Store<T>)
  return function(value)
    Store:setAtomState(value)
  end
end

return useSetStore