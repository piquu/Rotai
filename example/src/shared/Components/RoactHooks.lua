local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local Hooks = require(ReplicatedStorage.Packages.roacthooks)
local RotaiRoactHooks = require(ReplicatedStorage.Packages.rotairoacthooks)

local function Component(_props, hooks)
  local value, setValue = RotaiRoactHooks.useAtom(hooks)
  return Roact.createElement('TextButton', {
    AnchorPoint = Vector2.new(.5, .5),
    Size = UDim2.new(0, 100, 0, 100),
    Position = UDim2.new(.8, 0, .5, 0),
    Text = value,
    [Roact.Event.Activated] = function()
      setValue('Roact Hooks')
    end,
  })
end

return Hooks.new(Roact)(Component)