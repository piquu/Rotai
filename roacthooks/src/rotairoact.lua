local Rotai

local paths = {
  function()
    return script.Parent.Parent.Parent['piquu_rotai-roact@0.1.6']['rotai-roact']
  end,
  function()
    return script.Parent.Parent.Parent.Parent['rotai-roact']
  end,
  function()
    return script.Parent.Parent.Parent.Parent['Rotai-Roact']
  end,
  function()
    return script.Parent.Parent.Parent.Parent.rotairoact
  end,
  function()
    return script.Parent.Parent.Parent.Parent.RotaiRoact
  end,
  function()
    return game.ReplicatedStorage.Packages['rotai-roact']
  end,
  function()
    return game.ReplicatedStorage.Packages['Rotai-Roact']
  end,
  function()
    return game.ReplicatedStorage.Packages.rotaiRoact
  end,
  function()
    return game.ReplicatedStorage.Packages.RotaiRoact
  end,
}

for _, fn in paths do
  local success, response = pcall(fn)

  if success then
    Rotai = require(response)
    break
  end
end

return Rotai