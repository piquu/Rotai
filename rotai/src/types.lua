local signal = require(script.Parent.signal)

-- Atom Types

export type Getter<T> = () -> T

export type Setter<T> = (value: T) -> ()

export type Update<T> = {
  value: T?,
  [any]: any,
}

export type Read<T> = (get: Getter<T>) -> T

export type Write<T> = (get: Getter<T>, set: Setter<T>, update: Update<T>) -> ()

export type Atom<T> = {
  init: T,
  read: Read<T>,
  write: Write<T>,
}

-- Store Types

export type GetAtomState<T> = (self: Store<T>) -> T

export type SetAtomState<T> = (self: Store<T>, state: Update<T>) -> ()

export type OnAtomStateChange<T> = (self: Store<T>, fn: (value: T) -> ()) -> signal.Connection

export type Store<T> = {
  atom: Atom<T>,
  state: T,
  signal: signal.Signal,
  -- getAtomState: GetAtomState<T>,
  get: (self: Store<T>) -> T,
  -- setAtomState: SetAtomState<T>,
  set: (self: Store<T>, state: Update<T>) -> (),
  -- onAtomStateChange: OnAtomStateChange<T>,
  sub: (self: Store<T>, fn: (value: T) -> ()) -> signal.Connection,
}

return nil