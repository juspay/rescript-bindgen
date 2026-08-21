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
export declare class Box<T extends string> {
  constructor(value: T);
  readonly size: number;
}
