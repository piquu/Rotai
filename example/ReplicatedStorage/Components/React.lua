local React = require(game.ReplicatedStorage.Packages.react)

local function Component()
  local value, setValue = React.useState('React Lua')
  return React.createElement('TextButton', {
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(.8, 0, .5, 0),
    Text = value,
    [React.Event.Activated] = function()
      setValue('Soon!')
    end,
  })
end

return Component