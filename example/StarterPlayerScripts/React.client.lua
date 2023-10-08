local React = require(game.ReplicatedStorage.Packages.react)
local ReactRoblox = require(game.ReplicatedStorage.Packages['react-roblox'])
local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local atom = require(game.ReplicatedStorage.Atom)

local ReactComponent = require(game.ReplicatedStorage.Components.React)


local app = React.createElement(Rotai.React.Provider(React), {
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