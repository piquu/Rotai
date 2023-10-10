local function Provider(Roact)
  local Context = require(script.Parent.Context)(Roact)

  local function Component(props)
    return Roact.createElement(Context.Provider, {
      value = props.store,
    }, Roact.oneChild(props[Roact.Children]))
  end

  return Component
end

return Provider