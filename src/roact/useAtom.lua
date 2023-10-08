local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)

local function useAtom<T>(Component, Atom: types.Atom<T>?)
  local Store = store.getDefaultStore(Atom or Component.props.Atom)

  local state = Store:getAtomState()

  Store:onAtomStateChange(function(value)
    state = value
    Component:setState({})
  end)

  local function setValue(value: T)
    Store:setAtomState(value)
    Component:setState({})
  end

  local function value()
    return state
  end

  return value, setValue
end

return useAtom