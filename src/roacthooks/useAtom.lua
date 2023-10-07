local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useAtomValue<T>(hooks, Store: types.Store<T>)
  local mappedState, setMappedState = hooks.useState(function()
    return Store:getAtomState()
  end)

  hooks.useEffect(function()
    local Connection = Store:onAtomStateChange():Connect(function(value)
      setMappedState(value)
    end)

    return function()
      Connection:Disconnect()
    end
  end)

  return mappedState
end

local function useSetAtom<T>(Store: types.Store<T>)
  return function(value)
    Store:setAtomState(value)
  end
end

local function useAtom<T>(hooks, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Parent.roact.Context)(hooks.Roact)
  Atom = Atom and hooks.useValue(Atom) or hooks.useContext(Context)
  local Store: types.Store<T> = hooks.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return useAtomValue(hooks, Store), useSetAtom(Store)
end

return useAtom