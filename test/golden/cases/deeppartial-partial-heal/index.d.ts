// #208 — recover PARTIALLY-degraded `DeepPartial<>` token records (the heal now attempts any record
// with a fallback, not only ≥80%-degraded ones), WITHOUT re-resolving a deliberately-suppressed
// ambiguous-overload field (the `_heal` snapshot restores `noPolyTag` so #177 holds).

type Globals = "-moz-initial" | "inherit" | "initial" | "unset"
type Color = Globals | "red" | (string & {})
type DeepPartial<T> = T extends object ? { [P in keyof T]?: DeepPartial<T[P]> } : T

// nested deep enough that the FIRST reach truncates past MAX_DEPTH into a loose ghost, which the
// depth-0 heal rebuild then re-expands to a real record.
interface D6 { color: Color }
interface D5 { d6: D6 }
interface D4 { d5: D5 }
interface D3 { d4: D4 }
interface D2 { d3: D3 }
interface D1 { d2: D2 }
interface Deep { d1: D1 }

// PARTIALLY degraded: many good fields + one DeepPartial-deep field. Below the old 80% bar (1/5 = 20%),
// so it stayed a ghost; #208 recovers it (good fields typed, the genuinely-deep field stays flagged).
interface Tokens {
  label: string
  count: number
  active: boolean
  size: number
  deep: DeepPartial<Deep>
}
type JsxElement = { __brand: "element" }
export declare const Themed: (props: { tokens?: DeepPartial<Tokens> }) => JsxElement

// SUPPRESSION GUARD (#177): `_format` sits in an ambiguous overloaded slot → stays a flagged `string`
// even though its sibling `nested` recovers. Without the `_heal` noPolyTag snapshot, the heal would
// re-resolve `_format` into a fake `[#"fmtA"]` and merge with `unambiguous`.
interface OrdTagged<F extends string> {
  _format: F
  nested: DeepPartial<Deep>
  v: string
}
interface OrdPut {
  (name: 'a'): OrdTagged<'fmtA'>
  (name: string): OrdTagged<'fmtB'>
}
export declare class Svc {
  ambiguous: OrdPut
  unambiguous(): OrdTagged<'fmtA'>
}
