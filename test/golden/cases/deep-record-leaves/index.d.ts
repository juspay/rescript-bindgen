// #98.2 — a record first reached PAST `MAX_DEPTH` used to freeze EVERY field as an unmarked
// `string` — the depth cutoff returned opaque before the primitive checks, so even zero-cost
// leaves like `enabled?: boolean` truncated (Highcharts' `TooltipOptions`: ~40 all-string fields,
// zero markers, `formatter?: string` inexpressible downstream).
//
// Two guarantees locked here, on `deepTip` (first reached at depth 7 via the l1→…→l6 chain):
//   1. leaf fields keep their EXACT types past the bound — `enabled: bool`, `padding: float`,
//      `mode: string` (a literal folds to its base primitive: past the bound the alternative
//      was an opaque `string` anyway), `payload: JSON.t`;
//   2. fields that DO degrade (the `formatter` callback, the `extra` object — each dangling a
//      NEW record so deep-record healing rolls back rather than materializing the graph) carry
//      the same `⚪ loose — was …` flag props get, instead of silently reading as real strings.
type JsxElement = { __brand: 'element' }

// each level dangles a `sibling` record so the chain is "unbounded-ish": the healing pass would
// need NEW registry entries to re-resolve, so it rolls back and the deep truncation stays.
interface Extra1 { e1: string; deeper?: Extra2 }
interface Extra2 { e2: string; deeper?: Extra3 }
interface Extra3 { e3: string }

interface DeepTip {
  enabled?: boolean
  padding?: number
  mode?: 'compact'
  count?: number
  label?: string
  payload?: unknown
  formatter?: (value: number) => string
  extra?: Extra1
}

interface L6 { tip?: DeepTip; s6?: string }
interface L5 { l6?: L6; s5?: string }
interface L4 { l5?: L5; s4?: string }
interface L3 { l4?: L4; s3?: string }
interface L2 { l3?: L3; s2?: string }
interface L1 { l2?: L2; s1?: string }

export declare const DeepPanel: (props: { root?: L1 }) => JsxElement
