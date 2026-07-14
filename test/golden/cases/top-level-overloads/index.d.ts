// Top-level function OVERLOADS: only signature[0] bound, the rest silently dropped (#109.8). Each
// overload now binds — the first keeps the bare name, the others get a deterministic param-derived
// suffix; all share the one JS name (the hand-written N-externals idiom, `parse`/`parseWithRadix`).
export declare function parse(input: string): number
export declare function parse(input: string, radix: number): number

// a same-arity overload differing by type → `For<Params>` suffix (still distinct + stable)
export declare function wrap(value: string): string
export declare function wrap(count: number): string
