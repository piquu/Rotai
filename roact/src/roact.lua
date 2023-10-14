local Roact

local paths = {
  function()
    return script.Parent.Parent.Parent['roblox_roact@1.4.4']['roact']
  end,
  function()
    return script.Parent.Parent.Parent.Parent.roact
  end,
  function()
    return script.Parent.Parent.Parent.Parent.Roact
  end,
  function()
    return game.ReplicatedStorage.Packages.roact
  end,
  function()
    return game.ReplicatedStorage.Packages.Roact
  end,
}

for _, fn in paths do
  local success, response = pcall(fn)

  if success then
    Roact = require(response)
    break
  end
end

return Roact