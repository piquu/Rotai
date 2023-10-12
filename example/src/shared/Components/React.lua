local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local RotaiReact = require(ReplicatedStorage.Packages.rotaireact)

local function Component()
  local value, setValue = RotaiReact.useAtom()

  return React.createElement('TextButton', {
    AnchorPoint = Vector2.new(.5, .5),
    Size = UDim2.new(0, 100, 0, 100),
    Position = UDim2.new(.2, 0, .5, 0),
    Text = value,
    [React.Event.Activated] = function()
      setValue('React Lua')
    end,
  })
end

return Component