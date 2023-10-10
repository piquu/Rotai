local RoactContext

local function Context(Roact)
  if not RoactContext then
    RoactContext = Roact.createContext()
  end

  return RoactContext
end

return Context