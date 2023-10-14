local Rotai

local paths = {
  function()
    return script.Parent.Parent.Parent['piquu_rotai@0.1.5']['rotai']
  end,
  function()
    return script.Parent.Parent.Parent.Parent.rotai
  end,
  function()
    return script.Parent.Parent.Parent.Parent.Rotai
  end,
  function()
    return game.ReplicatedStorage.Packages.rotai
  end,
  function()
    return game.ReplicatedStorage.Packages.Rotai
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