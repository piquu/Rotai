local function Provider(Roact)
  local Context = require(script.Parent.Context)(Roact)

  local Component = Roact.Component:extend('Provider')

  function Component:render()
    return Roact.createElement(Context.Provider, {
      value = self.props.store,
    }, Roact.oneChild(self.props[Roact.Children]))
  end

  return Component
end

return Provider