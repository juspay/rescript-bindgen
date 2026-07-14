// Class STATICS and SETTERS were silently dropped (#109.4). Statics live on the constructor/static
// type (not the instance), so `static create`/`static VERSION` never emitted; a `set value(v)`
// accessor was also absent. Statics now bind THROUGH the class object with `@scope("Widget")`, and
// a setter as `@set external <name>Set`. A plain (non-React) class otherwise unchanged.
export declare class Widget {
  constructor(id: string)
  // instance method + read-write accessor
  refresh(): void
  get value(): number
  set value(v: number)
  // a get-only accessor stays @get-only (no setter emitted)
  get id(): string
  // a WRITE-ONLY accessor: no getter exists at runtime, so it must NOT emit a spurious @get —
  // only `@set external tokenSet`.
  set token(v: string)
  // an instance `reset()` that COLLIDES with the static `reset()` below — the static's ReScript id
  // must be disambiguated (resetStatic) so it can't shadow the @send instance binding.
  reset(): void
  // STATICS
  static create(id: string): Widget
  static readonly VERSION: string
  static reset(): void
}
