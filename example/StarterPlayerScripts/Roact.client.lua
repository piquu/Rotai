local Roact = require(game.ReplicatedStorage.Packages.roact)
local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local atom = require(game.ReplicatedStorage.Atom)

local RoactComponent = require(game.ReplicatedStorage.Components.Roact)
local RoactHooksComponent = require(game.ReplicatedStorage.Components.RoactHooks)

local app = Roact.createElement(Rotai.roact.Provider(Roact), {
	store = atom,
}, {
	Roact.createElement('ScreenGui', {
		IgnoreGuiInset = true,
	}, {
		Roact.createElement(RoactComponent),
		Roact.createElement(RoactHooksComponent),
	})
})

Roact.mount(app, game.Players.LocalPlayer.PlayerGui)