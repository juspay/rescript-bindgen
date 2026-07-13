// Callable-with-properties whose carried props are ALL sink-homed (#128 follow-up). `Wrap`'s
// only dep is `size: string | number` -> `stringOrNumber` in CommonTypes (a SINK). The #128
// re-pick co-locates a callable with its non-sink prop deps; but when EVERY dep is a sink, the
// callable keeps its OWN module (`WrapTypes`) rather than sinking a `module Wrap = {…}` into
// CommonTypes — the leaf sink is for primitive unions, not callable modules. (Placement-only:
// `module Wrap` references `stringOrNumber` qualified across files, so no sink out-edge is
// created either way; this just keeps CommonTypes conventionally clean.)
type JsxElement = { __brand: 'element' }

export interface Wrap {
  (x: string): string
  size: string | number
}
export declare const wrap: Wrap

// contrast: a callable with a NON-sink prop dep still co-locates with it (the main #128 case).
export interface Opts { retries?: number }
export interface Client {
  (url: string): string
  opts: Opts
}
export declare const client: Client
