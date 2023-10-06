-- export * from './vanilla.ts'
-- export * from './react.ts'

--> Roact
-- export { Provider, useStore } from './react/Provider.ts'
-- export { useAtomValue } from './react/useAtomValue.ts'
-- export { useSetAtom } from './react/useSetAtom.ts'
-- export { useAtom } from './react/useAtom.ts'

--> Vanilla
-- export { atom } from './vanilla/atom.ts'
-- export type { Atom, WritableAtom, PrimitiveAtom } from './vanilla/atom.ts'
-- export { createStore, getDefaultStore } from './vanilla/store.ts'
-- export type {
--   Getter,
--   Setter,
--   ExtractAtomValue,
--   ExtractAtomArgs,
--   ExtractAtomResult,
--   SetStateAction,
-- } from './vanilla/typeUtils.ts'

--> Util
-- export * from './vanilla/utils.ts'
-- export * from './react/utils.ts'
local atom = require(script.atom)
local store = require(script.store)

local Rotai = {
  atom = atom,
  store = store,
}

return Rotai