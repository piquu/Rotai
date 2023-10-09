local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useSetAtom<T>(React, Atom: types.Atom<T>?)
  local Context = Atom and nil or require(script.Parent.Context)(React)
  Atom = Atom and React.useValue(Atom) or React.useContext(Context)
  local Store: types.Store<T> = React.useState(function()
    return store.getDefaultStore(Atom)
  end)

  return function(value)
    Store:setAtomState(value)
  end
end

return useSetAtom