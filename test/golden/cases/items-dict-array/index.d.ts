// #50 — Select's `items`: a `Record<string, V> | Array<{label, value: any}>` union, the
// last base-ui review component. Two mechanisms combine:
//   1. dict-vs-array discrimination: a `Record<string,V>` member (object) and an array
//      member are runtime-distinct (`Array.isArray`) -> `@unboxed Dict | ItemsConfigArr`.
//   2. round-tripping field generic: the element record's `value: any` is a value the
//      consumer BUILDS and gets back via `itemToStringValue` -> a genuine generic, minted
//      as a type variable `item<'a>` (NOT a flagged `string`). Threads through
//      `array<item<'a>>` -> the @unboxed -> the component. Narrowly scoped to ARRAY-ELEMENT
//      records (a plain record-field `any`, e.g. a state record consumed by className/style,
//      still stays flagged per #31 — it can't thread a per-component var).
type ReactNode = { __brand: 'node' }
export declare const Select: (props: {
  items?: Record<string, ReactNode> | ReadonlyArray<{ label: ReactNode; value: any }>
  itemToStringValue?: (value: any) => string
}) => ReactNode
