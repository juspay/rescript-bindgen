// Reproduces #205 (record→`string` widening) and #206 (csstype value-unions enumerated into
// giant `@unboxed` bodies + CSS-keyword constructor leakage). A csstype `Property.*` value union
// carries the CSS-wide `Globals` keywords (`-moz-initial | inherit | initial | unset`). Reached
// DIRECTLY, csstype detection maps it to `string`. Reached through a homomorphic mapped type
// (`DeepPartial<>` — blend's `ComponentTokenOverrides`), TypeScript re-projects each property and
// hands back an ALIAS-LESS synthesized union with no csstype declaration file — so the path-based
// detection misses it and the union is enumerated. The structural fallback (a union whose literals
// include the whole `Globals` set → `string`) keeps it `string` regardless of how it was reached.
type Globals = "-moz-initial" | "inherit" | "initial" | "unset"
type Color = Globals | "aliceblue" | "antiquewhite" | "currentcolor" | (string & {})
type FontSize = Globals | "large" | "medium" | "small" | number | (string & {})

type DeepPartial<T> = T extends object ? { [P in keyof T]?: DeepPartial<T[P]> } : T

interface TitleTokens {
  color: Color
  fontSize: FontSize
}
interface Tokens {
  title: TitleTokens
}

type JsxElement = { __brand: "element" }

interface CustomArm {
  custom: string
}

// `tokens` reaches the csstype-style leaves through DeepPartial (alias stripped);
// `direct` reaches them straight (alias intact) — both must map the leaf to `string`.
// The `mixed*` props guard over-match: a CSS value UNIONED with a genuine arm must KEEP that arm
// (never collapse to a bare `string` that silently drops it). A record, a dict (`{ [k]: V }`,
// responsive-token shape), and an array are all real arms — each stays modelled/flagged, not dropped.
export declare const Themed: (props: {
  tokens?: DeepPartial<Tokens>
  direct?: Color
  mixedRecord?: Color | CustomArm
  mixedDict?: Color | { [breakpoint: string]: Color }
  mixedArray?: Color | Color[]
}) => JsxElement
