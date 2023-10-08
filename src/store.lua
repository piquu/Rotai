local types = require(script.Parent.types)
local signal = require(script.Parent.signal)

local stores = setmetatable({}, {
  __index = function(_, k)
    error(`there is no store for {k}`)
  end,
})

local function createStore<T>(atom: types.Atom<T>): types.Store<T>
  local store = {
    atom = atom,
    state = atom.init,
    signal = signal.new(),
  } :: types.Store<T>

  local function get()
    return store.state
  end

  local function set(value: T)
    store.state = value
  end

  function store:getAtomState(): T
    return self.atom.read(get)
  end

  function store:setAtomState(state: T)
    self.atom.write(get, set, state)
    self.signal:Fire(self:getAtomState())
  end

  function store:onAtomStateChange(fn: (value: T) -> ()): signal.Connection
    return self.signal:Connect(fn)
  end

  stores[tostring(atom)] = store
  return stores[tostring(atom)]
end

local function getDefaultStore<T>(atom): types.Store<T>
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