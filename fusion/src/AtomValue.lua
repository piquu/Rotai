local Rotai = require(script.Parent.rotai)
local Fusion = require(script.Parent.fusion)
local updateAll = require(Fusion.Dependencies.updateAll)

local Value = {}
Value.__index = Value

function Value.new(Store)
  local self = setmetatable({
    type = 'State',
    kind = 'Value',
    dependentSet = setmetatable({}, { __mode = 'k' }),
    _value = Store:get(),
    _store = Store,
  }, Value)

  Store:sub(function(value)
    self._value = value
    updateAll(self)
  end)
  
  return self
end

function Value:set(newValue: any, force: boolean?)
  local oldValue = self._value
  if force or newValue ~= oldValue then
    self._store:set(newValue)
    updateAll(self)
  end
end

function Value:get()
  return self._value
end

local function AtomValue(Atom)
  local Store = Rotai.store.getDefaultStore(Atom)

  return Value.new(Store)
end

return AtomValue