// #120 — a NAMED bounded record reached PAST MAX_DEPTH before it's registered elsewhere truncated to
// `string` and stayed that way (Highcharts' `seriesEventsOptionsObject`: ~half the series linked it,
// ~half — reached it past-depth first — got `string`). A post-extraction `relinkRegistered` pass now
// re-resolves such fields once the record has materialized at a shallower site — zero-expansion,
// order-independent.
//
// `Deep` is processed FIRST and reaches `EventsObj` at depth 7 (l1…l6 chain) — past the bound, before
// it's registered → truncates. `Shallow` reaches `EventsObj` at depth 1 → materializes it. The
// relink pass then upgrades `Deep`'s `events` from `string` to `eventsObj`.
export { Deep } from './components/Deep/Deep'
export { Shallow } from './components/Shallow/Shallow'
