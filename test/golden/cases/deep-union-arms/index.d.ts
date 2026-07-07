// #115 item 1 — deep union fields whose arms are BOUNDED named objects/records used to collapse to
// a loose `string`, because (a) `memberOf` refused to expand a NAMED object arm (anti-graph-pull),
// and (b) a union reached past MAX_DEPTH was truncated wholesale before `unionNode` split it. Both
// are now gated on `boundedPastDepth`, recovering Highcharts' `tooltipOptions.shadow`
// (`boolean | ShadowOptionsObject`) and `seriesXrangeOptions.dataLabels` (`A | A[]`).
//
//   deepTip.shadow  (`boolean | ShadowOpts`) -> @unboxed Bool(bool) | ShadowOpts(shadowOpts)
//   deepTip.marks   (`Mark | Mark[]`)        -> @unboxed One(mark) | Many(array<mark>)
//   deepTip.width   (a plain bounded record)  -> the record materialized (not string)
// The l1…l6 chain pushes DeepTip past MAX_DEPTH (6) so the fields are classified past the bound.
type JsxElement = { __brand: 'element' }

interface ShadowOpts { color?: string; offsetX?: number; width?: number }
interface Mark { x?: number; label?: string }
interface WidthOpts { min?: number; max?: number }

interface DeepTip {
  shadow?: boolean | ShadowOpts
  marks?: Mark | Mark[]
  width?: WidthOpts
  enabled?: boolean
}

interface L6 { tip?: DeepTip; s6?: string }
interface L5 { l6?: L6; s5?: string }
interface L4 { l5?: L5; s4?: string }
interface L3 { l4?: L4; s3?: string }
interface L2 { l3?: L3; s2?: string }
interface L1 { l2?: L2; s1?: string }

export declare const Chart: (props: { root?: L1 }) => JsxElement
