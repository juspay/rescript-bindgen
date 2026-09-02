// #192 / #211 — a CONSTRAINED type parameter (`<T extends U>`) resolves to its bound U, EXCEPT when the
// parameter round-trips (appears in a parameter AND the return), where the type variable `'a` is kept
// to preserve the input->output connection. One rule across function / method / static / constructor.
// #211 extends this to a bound BURIED in a generic record wrapper — resolved in place to a shaped
// concrete record. See docs/plans/192-constrained-type-params.md and docs/plans/211-*.md.

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

// #211 — SHAPED in-place bound resolution: a constrained param-only `T` buried inside a generic RECORD
// wrapper (`Wrap<T>`) resolves the bound IN PLACE to a concrete, sound record (`Wrap<T extends string>`
// -> `{v: string}`), re-classified with `T` unregistered under the `resolveBound` reading key so the
// concrete `wrapString` COEXISTS with the generic `wrap<'a>` that round-trip siblings need. (ReScript 12
// has no bounded type variable, so a concrete instantiation is the max-safety faithful mapping; keeping
// `'a` would be UNSOUND — `boxParam({v: 42})` violates `T extends string`.) See docs/plans/211-*.md.
interface Wrap<T> { v: T }
export declare function boxParam<T extends string>(x: Wrap<T>): void; // #211 -> `{v: string}` (wrapString)
export declare function boxRoundTrip<T extends string>(x: Wrap<T>): Wrap<T>; // round-trips -> stays wrap<'a>
export declare function boxBoth<T extends string>(x: Wrap<T>): Wrap<T>; // both positions = round-trip -> wrap<'a>
export declare function arrParam<T extends string>(xs: T[]): void; // reachable -> array<string>

// #211 multi-var shaped wrapper (the base-ui `useRender` shape): each param-only bound resolves in place
// -> `{state: Dict.t<JSON.t>, el: Dom.element}`; the concrete name is positional (`parametersDictDomElement`).
interface Parameters<State, El> { state: State; el: El }
export declare function useRenderLike<State extends Record<string, unknown>, El extends HTMLElement>(p: Parameters<State, El>): void;

// #211 mixed multi-var: only the constrained param-only `T` resolves; the unconstrained round-trip `U`
// stays `'a`.
export declare function mixed<T extends string, U>(x: Wrap<T>, y: U): U; // -> (wrapString, 'a) => 'a

// #211 NESTED buried bound: the wrapper's field is itself a generic wrapper over `T` -> recurses.
interface Outer<T> { inner: Wrap<T> }
export declare function nestedParam<T extends string>(x: Outer<T>): void; // -> {inner: {v: string}}

// #211 SELF-REFERENTIAL wrapper: the concrete rebuild must terminate (register-early -> `type rec`).
interface SelfWrap<T> { v: T; next?: SelfWrap<T> }
export declare function selfParam<T extends string>(x: SelfWrap<T>): void; // -> type rec {v: string, next?: …}

// #211 ENUM FIELD in the wrapper: an enum shape holds no type var, so it must REUSE the generic enum
// entry (no `flag`/`flag2` duplicate) even when the wrapper is rebuilt concretely — `setFlag` references
// the SAME `flag` enum generically.
type Flag = "on" | "off";
interface Flagged<T> { v: T; kind: Flag }
export declare function flaggedParam<T extends string>(x: Flagged<T>): void; // -> {v: string, kind: flag}
export declare function setFlag(f: Flag): void; // references the SAME `flag` enum

// #211 DEEP buried bound past MAX_DEPTH (6) with a GENERIC sibling — SOUNDNESS regression guard (review):
// `d7RT` round-trips, so it registers the wrapper chain GENERICALLY (`d7<'a>` …). Past MAX_DEPTH the
// concrete rebuild of `deepParam`'s deep boundary would dedup into that generic twin (the entryKey there
// resolves with a stale `resolveBound=false`), and the twin's `'a` — stamped later by the heal +
// syncRefTparams post-pass — would leak a caller-pickable type var (an `int` accepted where `T extends
// string`). The rebuild's reachability guard rejects any build that references a non-`|rb` record, so the
// WHOLE param soundly falls back to a flagged `string` (never `<'a>`) — exactly the #192 / no-sibling
// behaviour. (Shallow wrappers and the no-sibling deep case keep their concrete/partial-concrete shape.)
interface D1<T> { v: T; n: D2<T> }
interface D2<T> { v: T; n: D3<T> }
interface D3<T> { v: T; n: D4<T> }
interface D4<T> { v: T; n: D5<T> }
interface D5<T> { v: T; n: D6<T> }
interface D6<T> { v: T; n: D7<T> }
interface D7<T> { v: T; n: D8<T> }
interface D8<T> { v: T }
export declare function deepParam<T extends string>(x: D1<T>): void; // generic sibling present -> sound flagged `string` (NO `<'a>`)
export declare function d7RT<T extends string>(x: D7<T>): D7<T>; // generic sibling registers d7<'a>/d8<'a>

// #211 EXACTLY-MAX_DEPTH boundary (7 levels, no sibling) — SOUNDNESS regression guard (review 2): the
// terminal record E7 sits AT depth 6 and its bare `v: T` field at depth 7. The `|rb` entry's heal must
// re-delete the stuck var, or `classify(T)` re-resolves the truncated field via the still-mapped typeVar
// to a bare `'a` (`e7String<'a> = {v:'a}`, accepting an `int` where `T extends string`). With the var
// removed at heal time it resolves to the BOUND -> fully concrete `e7String = {v: string}`.
interface E1<T>{v:T;n:E2<T>}
interface E2<T>{v:T;n:E3<T>}
interface E3<T>{v:T;n:E4<T>}
interface E4<T>{v:T;n:E5<T>}
interface E5<T>{v:T;n:E6<T>}
interface E6<T>{v:T;n:E7<T>}
interface E7<T>{v:T}
export declare function boundaryParam<T extends string>(x: E1<T>): void; // 7-level -> fully concrete, NO `<'a>`

// #211 tagVariant-WRAPPER scope (review — jagguji): a heterogeneous discriminated-union wrapper builds a
// genuine `tagVariant`, whose deep case bottoms out in a GENERIC-accessor opaque module (the same
// `'a`-escape hatch as the union/overload wrapper), so a top-level tagVariant wrapper is OUT OF v1 scope
// — flagged `string`, like `unionParam`. `tvRoundTrip` round-trips -> opaque module kept. A HOMOGENEOUS
// discriminated union collapses to a record and IS concretized. A tagVariant reached as a FIELD inside a
// record wrapper is still built concretely (sound — `u: tVString`, no `'a`): soundness comes from the
// `|rb` keying + the record-chain closure-walk gate + past-MAX_DEPTH degradation (a live-typevar
// heterogeneous union becomes an opaque module, not a tagVariant), so a generic tagVariant twin never
// actually arises; the tagVariant `_heal.type` read by `srcGeneric` is correct belt-and-suspenders.
type TV<T> = { tag: "a"; x: T } | { tag: "b"; y: T; extra: number };
type Homo<T> = { tag: "a"; x: T } | { tag: "b"; x: T };
interface RecWithTV<T> { name: T; u: TV<T> }
export declare function tvParam<T extends string>(v: TV<T>): void;      // heterogeneous -> flagged string (v1 scope)
export declare function tvRoundTrip<T extends string>(v: TV<T>): TV<T>; // round-trip -> opaque module kept
export declare function homoParam<T extends string>(v: Homo<T>): void;  // homogeneous -> collapses to concrete record
export declare function recTvParam<T extends string>(v: RecWithTV<T>): void; // record wrapper w/ tagVariant field -> {name:string, u: tVString}

// #211 RETURN-ONLY buried bound (rule #4): resolving a return-only bound would let the caller pick the
// type of a value the library controls, so the whole return stays flagged (NOT concretized).
export declare function mkBox<T extends string>(): Wrap<T>; // return-only -> flagged (rule #4)

// SOUNDNESS (opaque-module union wrapper) — OUT OF #211 v1 SCOPE: a constrained param-only `T` inside a
// multi-type UNION (`Wrap<T> | OtherArm`) classifies to an opaque `%identity` module keyed off the union
// (the `t:` keyspace, which ignores the resolve-bound reading), so concretizing it would leak an unsound
// `wrap<'a>` accessor. It KEEPS today's flagged `string`; `unionRoundTrip` round-trips -> module kept.
interface OtherArm { o: number }
export declare function unionParam<T extends string>(x: Wrap<T> | OtherArm): void; // -> flagged string (sound; v1 scope)
export declare function unionRoundTrip<T extends string>(x: Wrap<T> | OtherArm): Wrap<T> | OtherArm; // round-trip -> opaque module kept
