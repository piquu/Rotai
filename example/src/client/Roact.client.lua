local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Roact = require(ReplicatedStorage.Packages.roact)
local RotaiRoact = require(ReplicatedStorage.Packages.rotairoact)

local atom = require(ReplicatedStorage.atom)

local RoactComponent = require(ReplicatedStorage.Components.Roact)
local RoactHooksComponent = require(ReplicatedStorage.Components.RoactHooks)

local App = Roact.createElement(RotaiRoact.Provider, {
  store = atom,
}, {
  Roact = Roact.createElement('ScreenGui', {}, {
    RoactComponent = Roact.createElement(RoactComponent),
    RoactHooksComponent = Roact.createElement(RoactHooksComponent)
  })
})

Roact.mount(App, Players.LocalPlayer.PlayerGui)