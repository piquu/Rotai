local React = require(script.Parent.Parent.react)
local Rotai = require(script.Parent.Parent.rotai)
local Context = require(script.Parent.Context)

local function useAtom<T>(Atom: any?)
  Atom = Atom or React.useContext(Context)
  local Store = Rotai.store.getDefaultStore(Atom)

  local state, setState = React.useState(function()
    return Store:get()
  end)

  React.useEffect(function()
    local Connection = Store:sub(setState)

    return function()
      Connection:Disconnect()
    end
  end)

  return state, function(value)
    Store:set(value)
  end
end

return useAtom