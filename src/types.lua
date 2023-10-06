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
  subscribeAtom: (self: table, fn: (value: Value) -> ()) -> () -> (),
  fireSubscribers: (self: table, value: Value) -> (),
  getAtomState: (self: table) -> Value,
  setAtomState: (self: table, state: Value) -> (),
}

return nil