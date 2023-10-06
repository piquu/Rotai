local types = require(script.Parent.types)
local signal = require(script.Parent.signal)

local stores = setmetatable({}, {
  __index = function(_, k)
    error(`there is no store for {k}`)
  end,
})

local function createStore<Value>(atom: types.Atom<Value>): types.Store<Value>
  local store = {
    atom = atom,
    state = atom.init,
    signal = signal.new(),
  } :: types.Store<Value>

  function store:atomStateChanged()
    return self.signal
  end

  function store:getAtomState(): Value
    return self.atom.read(function()
      return self.state
    end)
  end

  function store:setAtomState(state: Value)
    self.atom.write(function()
      return self.state
    end, function(value: Value)
      self.state = value
    end, state)
    self.signal:Fire(self:getAtomState())
  end

  stores[tostring(atom)] = store
  return stores[tostring(atom)]
end

local function getDefaultStore<Value>(atom): types.Store<Value>
  local store

  local success, response = pcall(function()
    return stores[tostring(atom)]
  end)

  if success then
    store = response
  else
    store = createStore(atom)
  end

  return store
end

local store = {
  createStore = createStore,
  getDefaultStore = getDefaultStore,
}

return store