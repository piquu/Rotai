local Context

local paths = {
  function()
    return game.ReplicatedStorage.Packages._Index['piquu_rotai-roact@0.1.2']['rotai-roact'].Context
  end,
  function()
    return game.ReplicatedStorage.Packages['rotai-roact'].Context
  end,
  function()
    return game.ReplicatedStorage.Packages['Rotai-Roact'].Context
  end,
  function()
    return game.ReplicatedStorage.Packages.rotairoact.Context
  end,
  function()
    return game.ReplicatedStorage.Packages.RotaiRoact.Context
  end,
}

for _, fn in paths do
  local success, response = pcall(fn)

  if success then
    Context = require(response)
    break
  end
end

return Context