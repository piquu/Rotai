local function Consumer(Roact)
  local Context = require(script.Parent.Context)(Roact)

  return function(Component)
    return function()
      return Roact.createElement(Context.Consumer, {
        render = function(Atom)
          return Roact.createElement(Component, { Atom = Atom })
        end
      })
    end
  end
end

return Consumer