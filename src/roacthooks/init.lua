local useAtom = require(script.useAtom)
local useAtomValue = require(script.useAtomValue)
local useSetAtom = require(script.useSetAtom)

local roacthooks = {
  useAtom = useAtom,
  useAtomValue = useAtomValue,
  useSetAtom = useSetAtom,
}

return roacthooks