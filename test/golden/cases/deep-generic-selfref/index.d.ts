// #115 item 2 — a record field that back-references an IN-PROGRESS ancestor record past MAX_DEPTH
// used to truncate to a loose `string`, because past-depth in-progress-ancestor links from a FIELD
// were gated to function signatures only (`ctx.pastDepthFn`). Highcharts' `chart.options` is exactly
// this: the cycle `options → series → chart → options` means `options` is still being built when
// `chart.options` back-references it, so `chart<'b>.options` fell to `string` — blocking the portal
// from typing its chart-ref chain (`chart.options` re-read to apply hover zones).
//
// The restriction is now lifted for RECORD entries: the back-ref links and the cycle lands in one
// `type rec … and …` group (records can join `type rec`; the record↔module cycle that once forced
// the restriction is handled by the forward-declared abstract type, #110/#113).
//
//   `chartInstanceOptionsConfig`'s `options` field MUST link to `options` (its ancestor), NOT be
//   `string`. `options` is built at depth 4 (registered), and `chart.options` back-references it at
//   depth 7 — past MAX_DEPTH (6) and still in-progress.
type JsxElement = { __brand: 'element' }

interface Options { series?: Series[]; width?: number }
interface Series { chart?: ChartInstance; kind?: string }
interface ChartInstance { options?: Options; id?: string }  // ← the past-bound in-progress back-ref

interface L3 { opts?: Options; s3?: string }
interface L2 { l3?: L3; s2?: string }
interface L1 { l2?: L2; s1?: string }

export declare const Chart: (props: { root?: L1 }) => JsxElement
