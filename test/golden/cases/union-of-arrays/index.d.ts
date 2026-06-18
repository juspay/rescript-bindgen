// A UNION OF ARRAY types — `Preset[] | RangeConfig[] | RangeDefinition[] | (Preset | RangeConfig |
// RangeDefinition)[]` (DateRangePicker's `PresetsConfig`). Every arm is an `Array<…>`, so they all
// share the global `Array` symbol — which made the "same-generic-record" union collapse (added for
// `BaseUIChangeEventDetails<R>`) WRONGLY match: it treated the union as one record instantiated
// differently and built it from `Array`'s lib.es prototype methods (all inherited -> a bogus
// `{ ...JsxDOM.domProps }`, the `array<>` shape lost).
//
// It must map to `array<element-union>`. The element types are collected DISTINCTLY (the enum arm
// re-grouped to its enum, NOT expanded into its 3 string literals) and, since they're multiple object
// shapes that can't be `@unboxed`-discriminated, bound as an opaque module with one zero-cost `from*`
// view each — `array<PickerTypes.PresetsConfig.t>`. (#65 union-of-arrays)
type JsxElement = { __brand: 'element' }

export declare enum Preset {
  TODAY = 'today',
  YESTERDAY = 'yesterday',
  LAST_7_DAYS = 'last7Days',
}

type RangeConfig = {
  preset: Preset
  label?: string
  visible?: boolean
}

type RangeDefinition = {
  id: string
  label: string
  getRange: () => { start: string; end: string }
  visible?: boolean
}

type PresetsConfig =
  | Preset[]
  | RangeConfig[]
  | RangeDefinition[]
  | (Preset | RangeConfig | RangeDefinition)[]

export declare const Picker: (props: {
  // -> ~presets: array<PickerTypes.PresetsConfig.t>=? (opaque module: fromPreset / fromRangeConfig /
  //    fromRangeDefinition); NOT `{ ...JsxDOM.domProps }`, NOT a flat `string`.
  presets?: PresetsConfig
}) => JsxElement
