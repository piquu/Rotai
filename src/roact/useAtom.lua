local types = require(script.Parent.Parent.types)
local store = require(script.Parent.Parent.store)
local useAtomValue = require(script.Parent.useAtomValue)
local useSetAtom = require(script.Parent.useSetAtom)

local function useAtom<T>(Component, Atom: types.Atom<T>?)
  return useAtomValue(Component, Atom), useSetAtom(Component, Atom)
end

return useAtom