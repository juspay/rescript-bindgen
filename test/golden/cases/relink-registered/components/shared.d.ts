interface D4 { v: string } interface D3 { d4?: D4 } interface D2 { d3?: D3 } interface D1 { d2?: D2 }
// ONE shared interface referenced by both components (same type.id) — so a deep site that truncates
// it can be re-linked to the copy a shallow site registers. UNBOUNDED (the `nested` chain exceeds
// the past-bound materialize budget), so it truncates when reached past MAX_DEPTH.
export interface EventsObj { click?: (id: string) => void; nested?: D1 }
