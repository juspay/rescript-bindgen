@module("demo") @react.component
external make: (
  // ⚠️ REVIEW: `names` is `ClassValue` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~names: string=?,
) => React.element = "Widget"
