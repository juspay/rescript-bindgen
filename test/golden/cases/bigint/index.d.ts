// `bigint` is a first-class ReScript 12 type (`type t = bigint` in Stdlib_BigInt, `123n` literals).
// The generator had NO bigint handling: a bare `bigint` degraded to `string`, and — worse — a
// `bigint` arm POISONED an otherwise-fine `string | number` union. `memberOf` didn't recognize
// bigint → the whole `@unboxed` builder bailed (`buildable = false`) → the union fell to an opaque
// placeholder → bare `string`, silently dropping the `number` arm too (SingleSelectV2's
// `VirtualItemShape.key: string | number | bigint` → `string`). (#70)
//
// Now bigint is mapped as the ReScript `bigint` type: a bare field is `bigint`, and a union folds it
// in as a `Big(bigint)` arm of the untagged variant — sound because `bigint` is its own JS `typeof`
// bucket, distinct from string/number/boolean.
type JsxElement = { __brand: 'element' }

export type VirtualItemShape = {
  key: string | number | bigint // -> CommonTypes.stringOrNumberOrBigInt (NOT bare string)
  plainBig: bigint // -> bigint
  index: number
}

export declare const Widget: (props: {
  items: VirtualItemShape[]
  nb?: number | bigint // -> CommonTypes.numberOrBigInt
  control?: string | number // unaffected -> CommonTypes.stringOrNumber
}) => JsxElement
