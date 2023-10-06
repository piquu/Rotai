local types = require(script.Parent.types)

local keyCount = 0 -- global key count for all atoms

local function atom<Value>(initialValue: Value, read: types.Read<Value>?, write: types.Write<Value>?)
  keyCount += 1
  local key = `atom{keyCount}`

  read = read or function(get: types.Getter<Value>)
    return get()
  end

  write = write or function(_get: types.Getter<Value>, set: types.Setter<Value>, value: Value)
    set(value)
  end

  local config = setmetatable({
    init = initialValue,
    read = read,
    write = write,
  }, {
    __newindex = function()
      error(`{key} is read-only`)
    end,
    __tostring = function()
      return key
    end,
  })

  return config
end

return atom