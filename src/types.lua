local signal = require(script.Parent.signal)

export type Getter<Value> = () -> Value

export type Setter<Value> = (Value: Value) -> ()

export type Read<Value> = (get: Getter<Value>) -> Value

export type Write<Value> = (get: Getter<Value>, set: Setter<Value>, value: Value) -> ()

export type Atom<Value> = {
  init: Value,
  read: Read<Value>,
  write: Write<Value>,
}

export type Store<Value> = {
  atom: Atom<Value>,
  state: Value,
  signal: signal.Signal,
  getAtomState: (self: Store<Value>) -> Value,
  setAtomState: (self: Store<Value>, state: Value) -> (),
  atomStateChanged: (self: Store<Value>) -> signal.Signal,
}

return nil