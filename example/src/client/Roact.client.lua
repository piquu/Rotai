local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)
local RotaiRoact = require(ReplicatedStorage.Packages["rotai-roact"])

local atom = require(game.ReplicatedStorage.Atom)

local RoactComponent = require(game.ReplicatedStorage.Components.Roact)
local RoactHooksComponent = require(game.ReplicatedStorage.Components.RoactHooks)

local app = Roact.createElement(RotaiRoact.Provider(Roact), {
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