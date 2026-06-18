// A SELF-RECURSIVE union (clsx's `ClassValue = string | number | ClassValue[]`). A naive `@unboxed`
// would unroll the self-reference once per `MAX_DEPTH` level into a 5-deep nested monster type. The
// self-recursion guard in `classify` (a union-id stack) terminates the cycle at the FIRST re-entry as
// the opaque value `JSON.t`, so the self `ClassValue[]` arm becomes `array<JSON.t>` and the union
// stays a SINGLE finite `@unboxed` — usable, not a monster and not a flagged `string`. (#72)
type JsxElement = { __brand: 'element' }

type ClassValue = string | number | ClassValue[]

export declare const Widget: (props: {
  // -> ~names: @unboxed Str(string) | Num(float) | Arr(array<JSON.t>)  (finite, typed)
  names?: ClassValue
}) => JsxElement
