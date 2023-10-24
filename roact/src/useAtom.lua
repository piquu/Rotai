local Rotai = require(script.Parent.Parent.rotai)

local function useAtom(Component, Atom: any?)
  Atom = Atom or Component.props.Atom
  local Store = Rotai.store.getDefaultStore(Atom)

  local state = Store:get()

  Store:sub(function(value)
    state = value
    Component:setState({})
  end)

  local function setValue(value)
    Store:set(value)
  end

  local function value()
    return state
  end

  return value, setValue
end

return useAtom