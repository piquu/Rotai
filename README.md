# Rotai

A [Jotai](https://github.com/pmndrs/jotai) like state management library for [Roact](https://github.com/Roblox/roact), [Roact Hooks](https://github.com/Kampfkarren/roact-hooks) and [React Lua](https://github.com/jsdotlua/react-lua/)

> [!WARNING]  
> This library is wip. Breaking changed may occur.

## Installation

### Method 1: File (Roblox Studio)
- Download the `rbxm` model file from the [Github release page](https://github.com/piquu/Rotai/releases/tag/0.1.0).
- Insert the model into Roblox Studio into a place like `ReplicatedStorage`

### Method 2: Wally
- Add this like to your `wally.toml` file
```toml
rotai = "piquu/rotai@0.1.0"
```

## Todo
- [ ] Add support for Vanilla Roblox
- [ ] Add support for [react lua](https://github.com/jsdotlua/react-lua/)
- [ ] Write better [Documentation](/Documentation.md)

## [Documentation](/Documentation.md)
```lua
local Roact = require(path.to.roact)
local Rotai = require(path.to.rotai)

local Component = require(path.to.component)

local atom = Rotai.atom(0)

local app = Roact.createElement(Rotai.roact.Provider(Roact), {
	store = atom,
}, {
	Roact.createElement('ScreenGui', nil, {
		Roact.createElement(Component),
	})
})

Roact.mount(app, game.Players.LocalPlayer.PlayerGui)
```
Component:
```lua
local Roact = require(path.to.roact)
local Rotai = require(path.to.rotai)

local Component = Roact.Component:extend('Component')

function Component:init()
	self.count, self.setCount = Rotai.roact.useAtom(self)
end

function Component:render()
	return Roact.createElement('TextButton', {
		AnchorPoint = Vector2.new(.5, .5),
		Size = UDim2.new(0, 100, 0, 100),
		Position = UDim2.new(.5, 0, .5, 0),
		Text = tostring(self.value()),
		[Roact.Event.MouseButton1Click] = function(_)
			self.setValue(self.value() + 1)
		end,
	})
end

return Rotai.roact.Consumer(Roact)(Component)
```

## License
Rotai is available under the MIT license. See [LICENSE](LICENSE) for details.
