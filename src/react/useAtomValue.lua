local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useAtomValue<T>(React, Atom: types.Atom<T>)
  local Context = Atom and nil or require(script.Parent.Context)(React)
  Atom = Atom and React.useValue(Atom) or React.useContext(Context)
  local Store: types.Store<T> = React.useState(function()
    return store.getDefaultStore(Atom)
  end)

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

return useAtomValue