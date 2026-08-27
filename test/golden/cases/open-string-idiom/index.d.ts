// #210 — the `(string & {})` / `(number & {})` OPEN-LITERAL idiom ("any string/number, but keep the
// named literal suggestions") is semantically JUST the primitive and carries NO data. It must reduce to
// `string`/`float`, NEVER a bogus `{ ...JsxDOM.domProps }` bag (which `hasHtml` used to mint because
// String's lib.es prototype looks "inherited"). Covers standalone, mixed-primitive union, numeric,
// branded (must NOT be swallowed), and the pure-literal open union (pre-existing closed-variant path).

type DeepPartial<T> = T extends object ? { [P in keyof T]?: DeepPartial<T[P]> } : T
type JsxElement = { __brand: "element" }

interface Inner { c: "red" | "blue" | (string & {}) }

// GUARD (#210 review): a REAL record that merely OWNS a `toFixed`/`charCodeAt` method — a money/decimal
// type (decimal.js/bignumber.js shape) or a stringy wrapper — must NOT be mistaken for the primitive's
// apparent object and collapsed to a bare `float`/`string`. The apparent-object fingerprint requires
// EVERY own property to be a genuine String/Number prototype member, so these keep their full record.
interface Money { toFixed(digits: number): string; plus(other: Money): Money; currency: string; amount: number }
interface CharThing { charCodeAt(index: number): number; label: string }

export declare const Demo: (props: {
  // mixed-primitive union: the redundant `(string & {})` must NOT poison the union into a loose
  // `string` that drops `number` — it resolves to `stringOrNumber` (the headline fix).
  gap?: string | number | (string & {});
  // numeric open idiom -> float
  space?: number | (number & {});
  // standalone open idiom -> string (never a domProps bag)
  onlyOpen?: (string & {});
  // a genuine branded primitive must KEEP its nominal @unboxed variant (idiom reduction requires
  // ZERO own props, so the marker prop excludes it).
  brand: string & { readonly __brand: "id" };
  // pure-literal open union -> closed `@as` variant (PRE-EXISTING behavior, the escape is dropped).
  color?: "red" | "blue" | (string & {});
  // apparent-object form (DeepPartial re-projects `(string & {})` into String's prototype object):
  // still no junk — an honest loose `string`.
  deep?: DeepPartial<Inner>;
  // real records owning `toFixed`/`charCodeAt` — kept as full records, NEVER collapsed to float/string.
  money?: Money;
  ch?: CharThing;
  mixedMoney?: string | Money;
}) => JsxElement
