// Self-returning chained methods via a NON-exported base class (#24, hono's exact
// shape): `Impl.chain()` returns `Base<…>` — defined in ANOTHER file and not re-exported
// from the entry — so without base registration every call site would mint a numbered
// opaque record (impl2, impl17, …). Base-class symbols of exported classes register in
// classTypes (transitively, with an ambiguity guard), so the return maps to the
// chainable `t`. (A base that IS itself exported keeps its own type — not this case.)
import { Base } from './base'

export declare class Impl extends Base<string> {
  run(): string;
}
