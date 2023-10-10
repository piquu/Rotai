local types = require(script.Parent.types)
local store = require(script.Parent.store)
local useSetStore = require(script.Parent.useSetStore)

local function useSetAtom<T>(hooks, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Parent.Parent['piquu_rotai-roact@0.1.1']['rotai-roact'].Context)(hooks.Roact)
  Atom = Atom and hooks.useValue(Atom) or hooks.useContext(Context)
  local Store: types.Store<T> = hooks.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return useSetStore(Store)
end

return useSetAtom