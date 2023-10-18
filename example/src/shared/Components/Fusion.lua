local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local RotaiFusion = require(ReplicatedStorage.Packages.rotaifusion)
local New = Fusion.New
local OnEvent = Fusion.OnEvent

local atom = require(ReplicatedStorage.atom)

local value = RotaiFusion.AtomValue(atom)

local function Component()
  return New 'TextButton' {
    AnchorPoint = Vector2.new(.5, .5),
    Size = UDim2.new(0, 100, 0, 100),
    Position = UDim2.new(.8, 0, .5, 0),
    Text = value,
    [OnEvent('Activated')] = function()
      value:set('Fusion')
    end
  }
end

return Component
