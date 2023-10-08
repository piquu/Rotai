local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local atom = Rotai.atom('Atom', function(get)
  print('read was called')
  return get()
end, function(get, set, value)
  print('write was called')
  if get() == value then return end
  set(value)
end)

return atom