local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)
local Hooks = require(ReplicatedStorage.Packages["roact-hooks"])
local RotaiRoactHooks = require(ReplicatedStorage.Packages["rotai-roact-hooks"])

local function Component(props, hooks)
	local value, setValue = RotaiRoactHooks.useAtom(hooks)
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