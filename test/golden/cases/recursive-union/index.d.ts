// A SELF-RECURSIVE union (clsx's `ClassValue = string | number | ClassValue[]`). An `@unboxed`
// variant can't represent a recursive union — it would unroll once per `MAX_DEPTH` level into a
// 5-deep nested monster type. The recursion bottoms out at the depth bound as `opaque`, and the
// array-element imperfection gate in `memberOf` (mirroring the fn-return gate) makes the WHOLE union
// bail to an honest 🔍 REVIEW `string` placeholder instead of a half-faked `Arr(array<string>)` arm.
// (#70 review — same gate also removes a pre-existing faked `array<string>` element in blend's
// Highcharts `d` field.)
type JsxElement = { __brand: 'element' }

type ClassValue = string | number | ClassValue[]

export declare const Widget: (props: {
  // -> ~names: string=? with a ⚠️ REVIEW comment (NOT a recursive @unboxed monster)
  names?: ClassValue
}) => JsxElement
