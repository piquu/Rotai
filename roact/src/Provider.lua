local Roact = require(script.Parent.Parent.roact)
local Context = require(script.Parent.Context)

local function Provider(props)
  return Roact.createElement(Context.Provider, {
    value = props.store,
  }, Roact.oneChild(props[Roact.Children]))
end

return Provider