local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Fusion = require(ReplicatedStorage.Packages.fusion)
local New = Fusion.New
local Children = Fusion.Children

local FusionComponent = require(ReplicatedStorage.Components.Fusion)

New 'ScreenGui' {
  Parent = Players.LocalPlayer.PlayerGui,
  [Children] = {
    FusionComponent(),
  }
}