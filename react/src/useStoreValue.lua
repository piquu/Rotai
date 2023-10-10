local types = require(script.Parent.types)

local function useStoreValue<T>(React, Store: types.Store<T>)
  local mappedState, setMappedState = React.useState(function()
    return Store:getAtomState()
  end)

  React.useEffect(function()
    local Connection = Store:onAtomStateChange(function(value)
      setMappedState(value)
    end)

    return function()
      Connection:Disconnect()
    end
  end)

  return mappedState
end

return useStoreValue