local types = require(script.Parent.types)

local keyCount = 0 -- global key count for all atoms

local function atom<T>(initialValue: T,read: types.Read<T>?, write: types.Write<T>?)
  keyCount += 1
  local key = `atom{keyCount}`

  read = read or function(get: types.Getter<T>)
    return get()
  end

  write = write or function(get: types.Getter<T>, set: types.Setter<T>, value: T)
    if value == get() then return end
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