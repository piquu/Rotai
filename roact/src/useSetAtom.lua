local types = require(script.Parent.types)
local store = require(script.Parent.store)

local function useSetAtom<T>(Component, Atom: types.Atom<T>?)
  local Store = store.getDefaultStore(Atom or Component.props.Atom)

  local function setValue(value: T)
    Store:setAtomState(value)
  end

  return setValue
end

return useSetAtom