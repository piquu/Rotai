local types = require(script.Parent.types)
local store = require(script.Parent.store)

local function useAtomValue<T>(Component, Atom: types.Atom<T>?)
  local Store: types.Store<T> = store.getDefaultStore(Atom or Component.props.Atom)

  local state = Store:getAtomState()

  Store:onAtomStateChange(function(value)
    state = value
    Component:setState({})
  end)

  local function value()
    return state
  end

  return value
end

return useAtomValue