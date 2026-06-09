// Multi-runtime-type unions -> `@unboxed` untagged variants (discriminated at
// runtime by typeof / Array.isArray). At most one object case is allowed.
type JsxElement = { __brand: 'element' }

export declare const UnboxedUnions: (props: {
  width?: string | number                 // -> @unboxed stringOrNumber = Str(string) | Num(float)
  tags?: string | string[]                // -> @unboxed stringOrStringArray = Str(string) | StrArr(array<string>)
  checked?: boolean | 'indeterminate'     // -> @unboxed = Bool(bool) | @as("indeterminate") Indeterminate
  itemHeight?: number | ((index: number) => number) // -> @unboxed = Num(float) | Fn((int) => float)
}) => JsxElement
