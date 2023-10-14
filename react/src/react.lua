local React

local paths = {
  function()
    return script.Parent.Parent.Parent['jsdotlua_react@17.0.2']['react']
  end,
  function()
    return script.Parent.Parent.Parent.Parent.react
  end,
  function()
    return script.Parent.Parent.Parent.Parent.React
  end,
  function()
    return game.ReplicatedStorage.Packages.react
  end,
  function()
    return game.ReplicatedStorage.Packages.React
  end,
}

for _, fn in paths do
  local success, response = pcall(fn)

  if success then
    React = require(response)
    break
  end
end

return React