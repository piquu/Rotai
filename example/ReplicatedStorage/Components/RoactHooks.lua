local Roact = require(game.ReplicatedStorage.Packages.roact)
local Hooks = require(game.ReplicatedStorage.Packages['roact-hooks'])
local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local function Component(props, hooks)
	local value, setValue = Rotai.RoactHooks.useAtom(hooks)
	return Roact.createElement('TextButton', {
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(.5, 0, .5, 0),
		Text = tostring(value),
		[Roact.Event.MouseButton1Click] = function(_)
			setValue('Roact Hooks')
		end,
	})
end

return Hooks.new(Roact)(Component)