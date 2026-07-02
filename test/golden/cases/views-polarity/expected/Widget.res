@module("demo") @react.component
external make: (
  ~mode: ViewsPolarityTypes.ViewsPolarityMode.t=?,  // ⓘ was `"true" | "lazy" | VirtualBox | PlainSpot` — opaque; build with ViewsPolarityMode.true_ / ViewsPolarityMode.lazy_ / ViewsPolarityMode.fromVirtualBox / ViewsPolarityMode.fromPlainSpot
  // ⚠️ REVIEW: `collide` is `VirtualBox | PlainSpot | "trap-focus" | "trapFocus"` — couldn't be auto-typed exactly; emitted as `string` placeholder. Match the real type by hand.
  ~collide: string=?,
  ~onState: 'a => unit=?,  // ⓘ a parameter type could not be modelled — received as a type variable; annotate at the call site
  ~resolve: unit => ViewsPolarityTypes.ResolveTarget.t=?,  // ⓘ was `boolean | VirtualBox | PlainSpot` — opaque; build with ResolveTarget.fromBool / ResolveTarget.fromVirtualBox / ResolveTarget.fromPlainSpot / ResolveTarget.none
) => React.element = "Widget"
