// #50 — Select's `items`: a `Record<string, V> | Array<{label, value: any}>` union, the
// last base-ui review component. Two mechanisms combine:
//   1. dict-vs-array discrimination: a `Record<string,V>` member (object) and an array
//      member are runtime-distinct (`Array.isArray`) -> `@unboxed Dict | ItemsConfigArr`.
//   2. round-tripping field generic: the element record's `value: any` is a value the
//      consumer BUILDS (it's a PROP — an INPUT) -> a genuine generic `item<'a>`, threaded
//      through `array<item<'a>>` -> the @unboxed -> the component.
//
// POLARITY GUARD (#50 review): the generalization fires ONLY for consumer-SUPPLIED (input)
// positions. `Registry` below is a class whose `entries` GETTER returns the same
// `{label, value: any}[]` shape — but the consumer RECEIVES it (output), so `value` must
// STAY a flagged `string`, NOT become a free `'a` (which would unify with anything — unsound).
type ReactNode = { __brand: 'node' }
export declare const Select: (props: {
  items?: Record<string, ReactNode> | ReadonlyArray<{ label: ReactNode; value: any }>
  itemToStringValue?: (value: any) => string
}) => ReactNode
export declare class Registry {
  get entries(): ReadonlyArray<{ label: ReactNode; value: any }>
}
