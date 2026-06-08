// Unions that can't be discriminated by an `@unboxed` variant (multiple object
// shapes, or object | array<object>) -> an opaque-type module with zero-cost
// `%identity` `from*` constructors. The ONLY place %identity is allowed, and it's
// principled (the value passes straight through). Requires module mode.
type JsxElement = { __brand: 'element' }

interface DateRangePreset { id: string; label: string }
interface CustomConfig { from: string; to: string }
interface CustomDefinition { compute: string }

export declare const OpaqueModules: (props: {
  // ≥2 distinct object shapes -> module { fromDateRangePreset | fromCustomConfig | fromCustomDefinition }
  preset?: DateRangePreset | CustomConfig | CustomDefinition
  // object | array<object> -> module { fromElement | fromElements } (Element is lib.dom)
  boundary?: Element | Element[]
}) => JsxElement
