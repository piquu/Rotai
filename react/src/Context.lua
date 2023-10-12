-- local ReactContext

-- local function Context(React)
--   if not ReactContext then
--     ReactContext = React.createContext()
--   end

--   return ReactContext
-- end

-- return Context
local React = require(script.Parent.react)

local Context = React.createContext()

return Context