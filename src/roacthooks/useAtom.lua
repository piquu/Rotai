local types = require(script.Parent.Parent.types)
local useAtomValue = require(script.Parent.useAtomValue)
local useSetAtom = require(script.Parent.useSetAtom)

local function useAtom<T>(hooks, Atom: types.Atom<T>?)
  return useAtomValue(hooks, Atom), useSetAtom(hooks, Atom)
end

return useAtom