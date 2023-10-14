-- local function Provider(Roact)
--   local Context = require(script.Parent.Context)(Roact)

--   local function Component(props)
--     return Roact.createElement(Context.Provider, {
--       value = props.store,
--     }, Roact.oneChild(props[Roact.Children]))
--   end

--   return Component
-- end

-- return Provider

local Roact = require(script.Parent.roact)
local Context = require(script.Parent.Context)

-- local function Provider(props)
--   return Roact.createElement(Context.Provider, {
--     value = props.store,
--   }, Roact.oneChild(props[Roact.Children]))
-- end

local function Provider(props)
  return Roact.createElement(Context.Provider, {
    value = props.store,
  }, Roact.oneChild(props[Roact.Children]))
end

return Provider