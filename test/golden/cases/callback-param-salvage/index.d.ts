// #30 (probe I-1a) direct-callback param salvage. A callback prop whose RETURN is clean
// but whose PARAM can't be modelled (here a `symbol | bigint` -> review) keeps a usable
// typed callback with a fresh type variable for the bad param — `('a, string) => unit` —
// instead of collapsing the WHOLE prop to a `string` placeholder. Params flow
// library->consumer (the consumer RECEIVES the value), so an annotate-at-call-site hole
// is honest. A clean param stays typed; a callback with a BAD RETURN is NOT salvaged
// (faking a return feeds wrong values into the library) and stays flagged.
type JsxElement = { __brand: 'element' }
type Weird = symbol | bigint

export declare const Widget: (props: {
  onPick?: (item: Weird, label: string) => void
  onBadReturn?: (x: string) => Weird
  onClean?: (x: string) => void
}) => JsxElement
