local atom = require(script.atom)
local store = require(script.store)
local react = require(script.react)
local roact = require(script.roact)
local roacthooks = require(script.roacthooks)

local Rotai = {
  atom = atom,
  store = store,
  React = react,
  Roact = roact,
  RoactHooks = roacthooks,
}

return Rotai