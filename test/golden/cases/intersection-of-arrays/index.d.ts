// An INTERSECTION OF ARRAY types — `Item[] & Array<Item & { nestedItems?: Group[] }>` — arises
// when a `& { items: X[] }` override is intersected over a base `items: Y[]` (NestedSelectDrawer).
// `checker.isArrayType` is FALSE for the intersection, so without explicit handling it fell to
// recordNode and built a bogus record from the array's lib.es prototype methods (all inherited ->
// `{ ...JsxDOM.domProps }`, and the `array<>` wrapper was lost). It must map to an array whose
// element is the INTERSECTED element type. (#63 review)
type JsxElement = { __brand: 'element' }

type Item = { value: string; label: string }
type Group = { groupLabel?: string; items: Item[] }

export declare const List: (props: {
  // base `items: Item[]` intersected with an override `{ items: Array<Item & {nestedItems?}> }`
  data: Group & { items: Array<Item & { nestedItems?: Group[] }> }
}) => JsxElement
