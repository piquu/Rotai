local Roact = require(game.ReplicatedStorage.Packages.roact)
local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local Component = Roact.Component:extend('Component')

function Component:init()
	self.value, self.setValue = Rotai.roact.useAtom(self)
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

return Rotai.roact.Consumer(Roact)(Component)