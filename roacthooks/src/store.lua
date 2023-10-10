local types = require(script.Parent.types)

type store = {
  createStore: <T>(atom: types.Atom<T>) -> types.Store<T>,
  getDefaultStore: <T>(atom: types.Atom<T>) -> types.Store<T>,
}

local store: store = require(script.Parent.Parent.Parent['piquu_rotai@0.1.4']['rotai']).store

return store