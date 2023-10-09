local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useAtomValue<T>(hooks, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Parent.roact.Context)(hooks.Roact)
  Atom = Atom and hooks.useValue(Atom) or hooks.useContext(Context)
  local Store: types.Store<T> = hooks.useState(function()
    return store.getDefaultStore(Atom)
  end)

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

return useAtomValue