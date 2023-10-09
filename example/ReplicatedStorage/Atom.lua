local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local atom = Rotai.atom('Atom', function(get)
  print('read was called')
  return get()
end, function(get, set, update)
  print('write was called')
  if get() == update.value then return end
  set(update.value)
end)

return atom