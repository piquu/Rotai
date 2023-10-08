local signal = require(script.Parent.signal)

export type Getter<T> = () -> T

export type Setter<T> = (Value: T) -> ()

export type Read<T> = (get: Getter<T>) -> T

export type Write<T> = (get: Getter<T>, set: Setter<T>, value: T) -> ()

export type Atom<T> = {
  init: T,
  read: Read<T>,
  write: Write<T>,
}

export type Store<T> = {
  atom: Atom<T>,
  state: T,
  signal: signal.Signal,
  getAtomState: (self: Store<T>) -> T,
  setAtomState: (self: Store<T>, state: T) -> (),
  onAtomStateChange: (self: Store<T>, fn: (value: T) -> ()) -> signal.Connection,
}

return nil