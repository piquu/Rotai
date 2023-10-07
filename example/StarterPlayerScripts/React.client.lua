local React = require(game.ReplicatedStorage.Packages.react)
local ReactRoblox = require(game.ReplicatedStorage.Packages['react-roblox'])

local ReactComponent = require(game.ReplicatedStorage.Components.React)

local root = ReactRoblox.createRoot(Instance.new('Folder'))
root:render(ReactRoblox.createPortal(React.createElement('ScreenGui', {
  IgnoreGuiInset = true,
}, {
  React.createElement(ReactComponent)
}), game.Players.LocalPlayer.PlayerGui))