local Provider = require(script.Provider)
local Consumer = require(script.Consumer)
local useAtom = require(script.useAtom)

local roact = {
  Provider = Provider,
  Consumer = Consumer,
  useAtom = useAtom,
}

return roact