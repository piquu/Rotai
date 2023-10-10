local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)
local RotaiRoact = require(ReplicatedStorage.Packages["rotai-roact"])

local Component = Roact.Component:extend('Component')

function Component:init()
	self.value, self.setValue = RotaiRoact.useAtom(self)
end

function Component:render()
	return Roact.createElement('TextButton', {
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(.2, 0, .5, 0),
		Text = tostring(self.value()),
		[Roact.Event.MouseButton1Click] = function(_)
			self.setValue('Roact')
		end,
	})
end

return RotaiRoact.Consumer(Roact)(Component)