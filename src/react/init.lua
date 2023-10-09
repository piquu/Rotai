local Provider = require(script.Provider)
local useAtom = require(script.useAtom)
local useAtomValue = require(script.useAtomValue)
local useSetAtom = require(script.useSetAtom)

local react = {
  Provider = Provider,
  useAtom = useAtom,
  useAtomValue = useAtomValue,
  useSetAtom = useSetAtom,
}

return react