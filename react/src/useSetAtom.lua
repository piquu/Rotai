local types = require(script.Parent.types)
local store = require(script.Parent.store)
local useSetStore = require(script.Parent.useSetStore)

local function useSetAtom<T>(React: any?, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Context)(React)
  Atom = Atom and React.useValue(Atom) or React.useContext(Context)
  local Store: types.Store<T> = React.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return useSetStore(Store)
end

return useSetAtom