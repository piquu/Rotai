local Provider = require(script.Provider)
local Consumer = require(script.Consumer)
local useAtom = require(script.useAtom)
local useAtomValue = require(script.useAtomValue)
local useSetAtom = require(script.useSetAtom)

local roact = {
  Provider = Provider,
  Consumer = Consumer,
  useAtom = useAtom,
  useAtomValue = useAtomValue,
  useSetAtom = useSetAtom,
}

return roact