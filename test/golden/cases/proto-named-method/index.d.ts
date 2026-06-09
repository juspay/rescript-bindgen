// Props and callback-parameter TYPES whose names collide with `Object.prototype` members
// (`toString`, `valueOf`, `hasOwnProperty`, …) must NOT pick up the inherited native function
// from the REACT_EVENTS / EVENT_HANDLERS / ARIA_TYPES lookup maps — the lookups are guarded with
// `hasOwnProperty`. Without the guard, e.g. `toString` resolves to `Object.prototype.toString`
// (a native function) and emits as `function toString() { [native code] }` → a syntax error.
// (Reproduces a react-markdown compile failure.)
type JsxElement = { __brand: 'element' }

interface valueOf { id: string } // a type literally named after a prototype member

export declare const Proto: (props: {
  toString?: () => string             // prop name 'toString'   -> map lookups must MISS
  hasOwnProperty?: boolean            // prop name 'hasOwnProperty'
  onPick?: (arg: valueOf) => void     // param TYPE name 'valueOf' -> REACT_EVENTS must MISS
}) => JsxElement
