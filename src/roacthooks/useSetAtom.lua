local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useSetAtom<T>(hooks, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Parent.roact.Context)(hooks.Roact)
  Atom = Atom and hooks.useValue(Atom) or hooks.useContext(Context)
  local Store: types.Store<T> = hooks.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return function(value)
    Store:setAtomState(value)
  end
end

return useSetAtom