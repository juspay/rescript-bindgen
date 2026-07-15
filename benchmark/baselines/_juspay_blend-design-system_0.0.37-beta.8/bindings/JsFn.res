// The bare, untyped JS `Function` (#120) — a callable runtime leaf with no typed signature.
// Construct with the arity matching your callback, read back with the matching `asFnN`.
// Zero-cost: the function passes through unchanged.
type t
external fromFn0: (unit => 'a) => t = "%identity"
external fromFn1: ('a => 'b) => t = "%identity"
external fromFn2: (('a, 'b) => 'c) => t = "%identity"
external fromFn3: (('a, 'b, 'c) => 'd) => t = "%identity"
external asFn0: t => (unit => 'a) = "%identity"
external asFn1: t => ('a => 'b) = "%identity"
external asFn2: t => (('a, 'b) => 'c) = "%identity"
external asFn3: t => (('a, 'b, 'c) => 'd) = "%identity"
