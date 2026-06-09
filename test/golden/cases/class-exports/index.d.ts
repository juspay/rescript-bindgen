// Standalone class exports (M2). Each class -> its OWN `<ClassName>.res` file (a file
// is a ReScript module), holding an abstract `type t`, a `@new` constructor, `@send`
// instance methods, and `@get` data-property/getter bindings. Covers:
//   - a constructor with a required + an OPTIONAL labeled arg (-> `~step: float=?`)
//   - a method returning the SAME class       -> `t` (self-reference)
//   - a getter (`get value(): number`)        -> `@get external value: t => float`
//   - a `void` method                         -> `… => unit`
//   - a method taking ANOTHER exported class  -> `Counter.t` (cross-file module ref)
//   - a record param / return                 -> lands in the shared `*Types.res`
interface Options {
  start: number
  step?: number
}

export declare class Counter {
  constructor(start: number, step?: number)
  increment(by: number): Counter
  get value(): number
  reset(): void
}

export declare class Tracker {
  constructor(options: Options)
  watch(counter: Counter): void
  snapshot(): Options
}
