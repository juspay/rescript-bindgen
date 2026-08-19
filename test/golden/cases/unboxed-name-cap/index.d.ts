// An ANONYMOUS @unboxed union that enumerates many string literals (csstype `Property.*` mixes in
// blend's DeepPartial token types) would produce a 2000+ char member-enumerated name. Past a length cap
// the name degrades to a readable prefix + a member-derived shape hash (`fitContentKeyword…Etc<hash>`) —
// SHORT, deterministic, and dedup-preserving (identical members → identical capped name). The emitted
// @unboxed type is unchanged; only its name is capped. (#200)
type JsxElement = { __brand: "element" }
interface SizeCfg { px: number }
export declare const Widget: (props: {
  width?: "fitContentKeyword" | "maxContentKeyword" | "minContentKeyword" | "intrinsicKeyword" | "autoKeyword" | number | SizeCfg
}) => JsxElement
