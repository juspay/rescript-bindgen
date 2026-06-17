// A NUMERIC TS enum (`vertical = 0`) and a numeric LITERAL union (`1 | 2 | 3`) must emit an
// UNQUOTED `@as(0)` — the int runtime value. Emitting `@as("0")` (a string tag) silently
// mismatches the library at runtime (it compares against the number 0, not "0"). A genuine
// STRING-literal union (`'sm' | 'md'`) stays quoted `@as("sm")`. (#63 validation)
type JsxElement = { __brand: 'element' }

export declare enum Orientation {
  vertical = 0,
  horizontal = 1,
}

export declare const Widget: (props: {
  orientation?: Orientation // numeric enum   -> @as(0) / @as(1)
  level?: 1 | 2 | 3 // numeric literals -> @as(1) / @as(2) / @as(3)
  size?: 'sm' | 'md' | 'lg' // string literals  -> @as("sm") / …
}) => JsxElement
