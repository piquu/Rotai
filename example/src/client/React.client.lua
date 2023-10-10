local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.react)
local ReactRoblox = require(ReplicatedStorage.Packages["react-roblox"])
local RotaiReact = require(ReplicatedStorage.Packages["rotai-react"])

local atom = require(game.ReplicatedStorage.Atom)

local ReactComponent = require(game.ReplicatedStorage.Components.React)


local app = React.createElement(RotaiReact.Provider(React), {
  store = atom
}, {
  React.createElement('ScreenGui', {
    IgnoreGuiInset = true,
  }, {
    React.createElement(ReactComponent)
  })
})

local root = ReactRoblox.createRoot(Instance.new("Folder"))
root:render(ReactRoblox.createPortal(app, game.Players.LocalPlayer.PlayerGui))