// #119 — a record with a TS string INDEX SIGNATURE alongside named props (Highcharts' `CSSObject`:
// `[key: string]: bool|number|string` + `backgroundColor?`/…). The named fields used to win and the
// index sig was silently dropped, so an un-named key (`zIndex`) was unreachable through the typed
// record. Now the record keeps its named fields AND emits a `@set_index` setter (`cssObjectSet`) so
// `obj->cssObjectSet("zIndex", Num(100000.))` writes a FLAT key `obj["zIndex"] = 100000` — no unsafe
// cast, named typing intact. A pure index object (no named props) still maps to `Dict.t` upstream.
// An imperfect index value type falls back to `Dict`-style `JSON.t`.
type JsxElement = { __brand: 'element' }
interface CSSObject {
  [key: string]: boolean | number | string | undefined
  backgroundColor?: string
  color?: string
}
export declare const Box: (props: { style?: CSSObject; title?: string }) => JsxElement
