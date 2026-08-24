// #192 — a CONSTRAINED type parameter (`<T extends U>`) resolves to its bound U, EXCEPT when the
// parameter round-trips (appears in a parameter AND the return), where the type variable `'a` is kept
// to preserve the input->output connection. One rule across function / method / static / constructor.
// See docs/plans/192-constrained-type-params.md.

// (a) param-only constrained -> the bound `string`. `name` is consumed, never returned, so there is
//     no round-trip to preserve; `'a` would just accept `greet(42)`, which the library rejects.
export declare function greet<T extends string>(name: T): void;

// (b) param-only constrained to a string-literal UNION -> the readable polyvar union (not `'a`).
export declare function setSize<T extends "sm" | "md" | "lg">(size: T): void;

// (c) round-tripping constrained -> stays `'a`. `x` goes in and the same value comes back, so `'a`
//     preserves the caller's exact type (`pick("md": Size)` stays `Size`, not a widened `string`).
export declare function echo<T extends string>(x: T): T;

// (d) unconstrained param-only -> stays `'a` (a genuine generic input; there is no bound to resolve).
export declare function identity<T>(x: T): void;

// (e) unconstrained return-only -> flagged (rule #4): `'a` here lets the caller pick the type of a
//     value the library controls.
export declare function make<T>(): T;

// The same four-way rule on class members. A non-generic class exercises method + static; `Box`
// below exercises the constructor.
export declare class Registry {
  // instance method, param-only constrained -> the bound (union)
  register<T extends "on" | "off">(state: T): void;
  // instance method, round-trip constrained -> `'a`
  passThrough<T extends string>(value: T): T;
  // static, param-only constrained -> the bound `string`
  static of<T extends string>(raw: T): void;
}

// A generic class: its constructor parameter is `T` (class-level). Because the class binds as an
// abstract `t` and the constructor returns `t`, `T` cannot round-trip into the return, so it is
// param-only -> resolves to its bound `string`.
export declare class Boxed<T extends string> {
  constructor(value: T);
  readonly size: number;
}

// SOUNDNESS: a constrained param-only `T` buried inside a generic WRAPPER (`Wrap<T>`) can't be reached
// by the type-var substitution (it sits in the wrapper's type args), so keeping `'a` there would be
// UNSOUND — `boxParam({v: 42})` would compile though `T extends string` forbids it. The stuck param is
// degraded to a sound flagged `string` (ReScript 12 has no bounded generic, and resolving the bound in
// place -> a concrete `{v: string}` needs TS type instantiation the extractor doesn't do; that shaped
// upgrade is #211). A callback/array param, by contrast, IS reachable and resolves cleanly.
interface Wrap<T> { v: T }
export declare function boxParam<T extends string>(x: Wrap<T>): void; // -> flagged `string` (sound)
export declare function boxRoundTrip<T extends string>(x: Wrap<T>): Wrap<T>; // round-trips -> stays wrap<'a>
export declare function arrParam<T extends string>(xs: T[]): void; // reachable -> array<string>
