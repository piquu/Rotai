local types = require(script.Parent.Parent.types)
local useAtomValue = require(script.Parent.useAtomValue)
local useSetAtom = require(script.Parent.useSetAtom)

local function useAtom<T>(React, Atom: types.Atom<T>?)
  return useAtomValue(React, Atom), useSetAtom(React, Atom)
end

return useAtom