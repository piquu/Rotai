local Provider = require(script.Provider)
local Consumer = require(script.Consumer)
local Context = require(script.Consumer)
local useAtom = require(script.useAtom)

local roact = {
  Provider = Provider,
  Consumer = Consumer,
  Context = Context,
  useAtom = useAtom,
}

return roact