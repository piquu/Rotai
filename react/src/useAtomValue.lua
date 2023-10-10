local types = require(script.Parent.types)
local store = require(script.Parent.store)
local useStoreValue = require(script.Parent.useStoreValue)

local function useAtomValue<T>(React, Atom: types.Atom<T>)
  local Context = Atom and nil or require(script.Parent.Context)(React)
  Atom = Atom and React.useValue(Atom) or React.useContext(Context)
  local Store: types.Store<T> = React.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return useStoreValue(React, Store)
end

return useAtomValue