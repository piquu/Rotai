local Rotai = require(game.ReplicatedStorage.Packages.Rotai)

local atom = Rotai.atom('Atom', function(get)
	print('atom read: ', get())
	return get()
end, function(get, set, value)
	print('atom write: ', value)
	set(value)
end)

return atom