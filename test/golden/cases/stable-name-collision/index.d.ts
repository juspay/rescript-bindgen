// #90 residual — a generic-alias name instantiated with DIFFERENT type args collides onto ONE base
// (`sizeToken` for every `SizeToken<T>`), then got an ENCOUNTER-ORDER counter (`sizeToken`,
// `sizeToken2`, `sizeToken3`) whose number shifted whenever an unrelated instantiation was
// added/removed upstream — source-breaking for consumers who annotated the old name.
//
// The finalization pass now gives each colliding DISTINCT shape a per-shape INTRINSIC suffix
// (order-independent). Within a single module the home can't distinguish them, so the last-resort
// disambiguator is a stable content HASH of the shape (a pure function of the fields — adding or
// removing a sibling never renumbers it), NOT a counter. Across modules (see the blend benchmark)
// the readable home stem is used instead. Byte-identical shapes are deduped to one name; the three
// below are genuinely distinct (different `T`), so each keeps its own stable hash-suffixed name and
// every reference resolves to it.
type JsxElement = { __brand: 'element' }

type SizeToken<T> = { sm: T; md: T; lg: T }

export declare const Widget: (props: {
  gap?: SizeToken<number>
  label?: SizeToken<string>
  padding?: SizeToken<boolean>
}) => JsxElement
