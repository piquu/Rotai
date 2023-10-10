local types = require(script.Parent.types)

local function useStoreValue<T>(hooks, Store: types.Store<T>)
  local mappedState, setMappedState = hooks.useState(function()
    return Store:getAtomState()
  end)

  hooks.useEffect(function()
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