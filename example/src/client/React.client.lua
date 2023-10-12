local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages.reactroblox)
local RotaiReact = require(ReplicatedStorage.Packages.rotaireact)

local atom = require(ReplicatedStorage.atom)

local ReactComponent = require(ReplicatedStorage.Components.React)

local App = React.createElement(RotaiReact.Provider, {
  store = atom
}, {
  React = React.createElement('ScreenGui', {}, {
    ReactComponent = React.createElement(ReactComponent)
  })
})

local root = ReactRoblox.createRoot(Instance.new('Folder'))
root:render(ReactRoblox.createPortal(App, Players.LocalPlayer.PlayerGui))