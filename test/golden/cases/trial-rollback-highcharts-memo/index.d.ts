// #174 review — THE ROLLBACK MUST RESTORE ctx-LEVEL MEMOS, not just the registry.
//
// `registryTrial` restores `ctx.typeVars`, but `ctx.highchartsSeriesDataVar` is a MEMO that points
// INTO that map: it caches WHICH type variable carries the Highcharts series payload, so every
// `Series*Options.data` in one component shares one variable. Restoring the map without the memo
// left the memo naming a variable the rollback had just deleted — and the next INDEPENDENT
// `Series*Options` record reused that name instead of minting its own, silently welding two
// unrelated props onto one type variable:
//
//     type props<'a>      = { later?: 'a, live?: seriesLiveOptions<'a> }   // <- before: coupled
//     type props<'b, 'a>  = { later?: 'b, live?: seriesLiveOptions<'a> }   // <- after: independent
//
// The coupled form is not cosmetic: it forces a caller who passes a `string` for `later` to also
// make `live.data` an `array<string>`, for two props that have nothing to do with each other.
//
// THE SHAPE, and why each piece is load-bearing:
//  - `bail` is a @tag discriminated union, so it routes to `tagVariantNode` — an early-registering
//    builder that opens a `registryTrial`.
//  - Branch `'a'` pulls `SeriesInnerOptions`, whose `data: number[]` calls `highchartsSeriesDataNode`
//    and mints BOTH a type var and the memo — INSIDE the trial. This is the hard part: a
//    `Series*Options` record reachable from any earlier prop is resolved BEFORE the trial opens, so
//    the memo is set outside it and the rollback is a no-op. `SeriesInnerOptions` is therefore
//    referenced from nowhere else in the file.
//  - Minting a type var is exactly what `tagVariantNode`'s robustness gate (#65) refuses
//    (`if (tv.size) return rollback()`), so the bail is GUARANTEED, not incidental.
//  - `later: any` then mints the first surviving var, and `live` is the independent
//    `Series*Options` that must NOT reuse it.
//
// Verified to have teeth: on the parent commit this emits `props<'a>` with `later` and `live`
// sharing `'a`; with the memo snapshotted it emits `props<'b, 'a>`.
type JsxElement = { __brand: 'element' }

interface SeriesLiveOptions {
    data: number[]
    label: string
}

// Reachable ONLY from inside the variant branch below — see the note above.
interface SeriesInnerOptions {
    data: number[]
    name: string
}

type Bail =
    | { kind: 'a'; series: SeriesInnerOptions }
    | { kind: 'b'; other: number }

export declare const Chart: (props: {
    bail?: Bail
    later?: any
    live?: SeriesLiveOptions
}) => JsxElement
