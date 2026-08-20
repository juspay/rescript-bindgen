// Structural record dedup (Fix B) — the miniature of Hono's 1728-record explosion.
// `Router<S>` is generic and each method returns a DIFFERENTLY-instantiated `Router<S & …>`.
// TypeScript gives every instantiation a unique type id, so without dedup we'd emit a
// separate record for each — even though, once the phantom generics widen, many are
// byte-for-byte identical. Dedup collapses the identical ones so the deeper chain points at a
// single canonical instantiation instead of a duplicate.
// NB `build(): S` now materializes its record instead of degrading to `string` (#205 bounded-
// record heal). The two leaf routers therefore expose their real `build` return — `{ a; b }` vs
// `{ b; a }`, distinct by field order — so those two no longer merge; the dedup of the
// byte-identical instantiations up the chain is what this case still guards.
type Schema = Record<string, unknown>
interface Router<S extends Schema> {
  use(): Router<S & { a: true }>
  add(): Router<S & { b: true }>
  build(): S
}

export declare class App {
  constructor()
  start(): Router<{}>
}
