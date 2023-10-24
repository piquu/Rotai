-- local function Provider(React)
--   local Context = require(script.Parent.Context)(React)

--   local function Component(props)
--     return React.createElement(Context.Provider, {
--       value = props.store,
--     }, props.children)
--   end

--   return Component
-- end

-- return Provider
local React = require(script.Parent.Parent.react)
local Context = require(script.Parent.Context)

local function Provider(props)
  return React.createElement(Context.Provider, {
    value = props.store,
  }, props.children)
end

return Provider