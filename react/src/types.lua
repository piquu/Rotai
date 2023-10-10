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

-- Signal Types

export type Signal = {
	[any]: any,
	Connections: number,
	Connected: (connected: boolean, signal: Signal) -> ()?,
	Connect: (self: Signal, func: (...any) -> (), ...any) -> Connection,
	Once: (self: Signal, func: (...any) -> (), ...any) -> Connection,
	Wait: (self: Signal, ...any) -> ...any,
	Fire: (self: Signal, ...any) -> (),
	FastFire: (self: Signal, ...any) -> (),
	DisconnectAll: (self: Signal) -> (),
}

export type Connection = {
	[any]: any,
	Signal: Signal?,
	Disconnect: (self: Connection) -> (),
}

-- Store Types

export type GetAtomState<T> = (self: Store<T>) -> T

export type SetAtomState<T> = (self: Store<T>, state: Update<T>) -> ()

export type OnAtomStateChange<T> = (self: Store<T>, fn: (value: T) -> ()) -> Connection

export type Store<T> = {
  atom: Atom<T>,
  state: T,
  signal: Signal,
  -- getAtomState: GetAtomState<T>,
  getAtomState: (self: Store<T>) -> T,
  -- setAtomState: SetAtomState<T>,
  setAtomState: (self: Store<T>, state: Update<T>) -> (),
  -- onAtomStateChange: OnAtomStateChange<T>,
  onAtomStateChange: (self: Store<T>, fn: (value: T) -> ()) -> Connection,
}

return nil