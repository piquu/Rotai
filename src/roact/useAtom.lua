local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useAtom<T>(Component, Atom: types.Atom<T>?)
  local Store = store.getDefaultStore(Atom or Component.props.Atom)

  Store:onAtomStateChange(function()
    Component:setState({})
  end)

  local function setValue(value: T)
    Store:setAtomState(value)
    Component:setState({})
  end

  local function value()
    return Store:getAtomState()
  end

  return value, setValue
end

return useAtom