-- local function Consumer(Roact)
--   local Context = require(script.Parent.Context)(Roact)

--   return function(Component)
--     return function()
--       return Roact.createElement(Context.Consumer, {
--         render = function(Atom)
--           return Roact.createElement(Component, { Atom = Atom })
--         end
--       })
--     end
--   end
-- end

-- return Consumer
local Roact = require(script.Parent.roact)
local Context = require(script.Parent.Context)

local function Consumer(Component)
  return function()
    return Roact.createElement(Context.Consumer, {
      render = function(Atom)
        return Roact.createElement(Component, { Atom = Atom })
      end
    })
  end
end

return Consumer