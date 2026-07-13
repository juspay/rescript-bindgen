// #128 — callable-module HOME placement must see PROP-derived deps, not just sig-derived ones.
//
// `Client` is callable-with-properties: its call signature is dep-free (`(url) => Promise<string>`),
// so the #115 "co-locate with the first non-sink dep" pick used to run on an EMPTY dep set and the
// module kept its declaring-file home (ClientTypes). Its props are the only edges: `defaults: Config`
// and `create(config): Client` both reference ConfigTypes. The pick now re-runs after carried-prop
// classification, so `module Client` lands IN ConfigTypes next to `config` (bare refs, no
// cross-module qualification) and no ClientTypes module is emitted at all.
//
// The self-returning `create(config): Client` is the load-bearing regression guard twice over:
//  - its ref to `Client.t` is minted DURING prop classification (recursion cache) with the stale
//    pre-pick home; render homes are late-bound (resolved through the registry by ref.key), so it
//    must still qualify against the FINAL home.
//  - as a dep it points at the entry ITSELF; the re-pick excludes the self key so it can't out-vote
//    the real Config deps.
export { Client, client } from './components/Client/Client'
export { Config } from './components/Config/Config'
