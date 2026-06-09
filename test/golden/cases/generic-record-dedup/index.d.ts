// Structural record dedup (Fix B) — the miniature of Hono's 1728-record explosion.
// `Router<S>` is generic and each method returns a DIFFERENTLY-instantiated `Router<S & …>`.
// TypeScript gives every instantiation a unique type id, so without dedup we'd emit a
// separate record for each — even though, once the phantom generics widen, many are
// byte-for-byte identical. Dedup collapses the identical ones: the two leaf routers (which
// both become `{use: unit=>string, add: unit=>string, build: unit=>string}`) merge into one,
// so the deeper chain points at a single canonical leaf instead of a duplicate.
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
