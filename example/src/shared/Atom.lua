local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Rotai = require(ReplicatedStorage.Packages.rotai)

local atom = Rotai.atom(
  'Atom',
  function(get)
    print('atom read')
    return get()
  end,
  function(get, set, update)
    if get() == update.value then return end
    print('write atom')
    set(update.value)
  end
)

return atom