local Fusion

local paths = {
  function()
    return script.Parent.Parent.Parent['elttob_fusion@0.2.0']['fusion']
  end,
  function()
    return game.ReplicatedStorage.Packages._Index['elttob_fusion@0.2.0']['fusion']
  end,
}

for _, fn in paths do
  local success, response = pcall(fn)

  if success then
    Fusion = response
    break
  end
end

return Fusion