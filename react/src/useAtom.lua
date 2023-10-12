local React = require(script.Parent.react)
local Rotai = require(script.Parent.rotai)
local Context = require(script.Parent.Context)

local function useAtom(Atom: any?)
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