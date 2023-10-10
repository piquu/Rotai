local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rotai = require(ReplicatedStorage.Packages.rotai)

local atom = Rotai.atom('Atom', function(get)
  print('read was called')
  return get()
end, function(get, set, update)
  print('write was called')
  if get() == update.value then return end
  set(update.value)
end)

return atom