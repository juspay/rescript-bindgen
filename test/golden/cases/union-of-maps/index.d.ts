// A UNION OF Map types — `Map<string, OnClick> | Map<string, OnHover>`. Both arms are
// instantiations of the SAME builtin `Map`, so they share ONE global `lib.es` symbol — exactly
// the way `Array<A> | Array<B>` shares the global `Array` symbol (#67). That made the
// "same-generic-record" union collapse (added for `BaseUIChangeEventDetails<R>`) WRONGLY match:
// it treated the union as one record instantiated differently and built it from `Map`'s lib.es
// prototype methods (all inherited -> a bogus `{ ...JsxDOM.domProps }`, the map shape lost).
//
// #67 closed only arrays (`!isArrayType`). #68 generalises the guard to `isBuiltinContainer`,
// which excludes the whole class of lib.es containers whose instantiations share one global
// symbol (`Map`/`Set`/`Promise`/`WeakMap`/`Array`) — so this union no longer collapses to a
// domProps record. (NOT the broader `!isLibraryType`: that also blocks `@types`/csstype records
// that legitimately collapse — see hono/react-markdown in the bench.) A first-party record
// (`@base-ui`'s `BaseUIChangeEventDetails<R>`) is no container, so its real collapse survives.
//
// Rather than flag a `string`, the container union gets the SAME faithful treatment the
// union-of-arrays case gets: an OPAQUE MODULE with one construct-only `from*` view per arm.
// Each arm types cleanly on its own (a single `Map<K,V>` → `Map.t<K,V>`), but the two Maps are
// runtime-indistinguishable (`object`), so it's construct-only. Arms are named by value type
// (`fromMapOnClick`/`fromMapOnHover`) since the bare `Map` name repeats.
//
//   handlers -> ~handlers: UnionOfMapsTypes.Handlers.t=?  (module Handlers with
//               fromMapOnClick: Map.t<string, string => unit> / fromMapOnHover: Map.t<string, string => bool>)
type JsxElement = { __brand: 'element' }

type OnClick = (id: string) => void
type OnHover = (id: string) => boolean

export declare const Handlers: (props: {
  // -> an opaque module (fromMapOnClick / fromMapOnHover), NOT `{ ...JsxDOM.domProps }`, NOT `string`.
  handlers?: Map<string, OnClick> | Map<string, OnHover>
}) => JsxElement
