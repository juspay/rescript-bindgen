// #186 — EVERY ARM OF A VIEWS MODULE GETS BOTH DOORS.
//
// A views module is `from<X>` (put a value in) + `as<X>` (read one back out, #122). The reader used to
// be gated on a structured KIND or an explicit name hint, while the CONSTRUCTOR name falls back to
// `m.type.kind` — two different sources, so they disagreed and an arm could get a one-way door:
//
//     external fromArray: array<string> => t = "%identity"     // no asArray
//
// That split tracked NAMING, not soundness. The give-away is `primArr` vs `nestArr` below: `string[]`
// had NO reader but `string[][]` DID, purely because TS names the inner element `Array` so a hint
// existed. `boolArm` likewise had one only because `opaqueUnion` hard-codes `name: 'Bool'`. Nothing
// about safety separates these — `asArray: t => array<string>` is exactly as unchecked as the
// `asNamedA` beside it, and both require the caller to establish the arm first.
//
// REAL COST: Highcharts' `ColorType = ColorString | GradientColorObject | PatternObject` is returned by
// `color(…).get()` and almost always holds the plain string. `asString` didn't exist, so the only
// reader that compiled was `asGradientColorObject` — a silent misread of a string as a record. 53 of
// 1624 views modules in the benchmark baselines had at least one reader-less arm; 42 of those were this
// `string | number | record` shape.
type JsxElement = { __brand: 'element' }

interface NamedA { a: string }
interface NamedB { b: number }

// The Highcharts shape, 42 of the 53. Two named object arms carry the module; `string` and `number`
// are the arms that had constructors and no readers, and they are the COMMON runtime cases.
type BorderRadius = number | string | NamedA | NamedB

// THE ASYMMETRY PAIR — these two must now match. Before the fix `primArr` emitted `fromArray` alone
// while `nestArr` emitted `fromArrays` + `asArrays`; if a future change re-couples the reader to the
// name hint, these two diverge again and this case fails.
type PrimArr = NamedA | NamedB | string[]
type NestArr = NamedA | NamedB | string[][]

// Bare primitive arms. `bool` already had a reader (hard-coded hint); `number` did not.
type NumArm = NamedA | NamedB | number
type BoolArm = NamedA | NamedB | boolean

// ARMS THAT CORRECTLY GET NO READER — each IS its own runtime value, and all three `continue` before
// the gate. `'auto'`/`'none'` are ready-made constants; a run of >= 4 literals folds into ONE `fromTag`
// polyvar. A reader for either would hand back a value the polyvar already pins exactly.
type WithLiterals = NamedA | NamedB | 'auto' | 'none'
type WithTagRun = NamedA | NamedB | 'aa' | 'bb' | 'cc' | 'dd' | 'ee'

// THE ONE DELIBERATE EXCLUSION — a TYPE-VARIABLE arm gets `fromTypeVar` and NO reader, because
// `asTypeVar: t => 'e` unifies with ANY type at the call site: a universal unsafe cast, not a view of
// one arm. Every other reader here is pinned to a concrete arm and can only misread WITHIN this union.
// This is base-ui's real `AriaCombobox.filteredItems` shape (`readonly any[] | readonly Group<any>[]`,
// which collapses to one array whose ELEMENT is the union) — prop-position `any` becomes a type var,
// so the module arms are the type var and `group<'f>`. Pinned by a golden and not only by the
// benchmark, since the benchmark is an opt-in gate that a wholesale "emit readers unconditionally"
// simplification would sail past.
type Group<T> = { items: T[]; label: string }

// RECEIVE POSITION — polarity lets a readable module through here (#39/#122) precisely because the
// consumer can inspect what the library produced. With no `asString`/`asNumber` that promise was
// unmet: the value arrives and the primitive cases are unreadable.
export declare const Chart: (props: {
    filteredItems?: readonly any[] | readonly Group<any>[]
    borderRadius?: BorderRadius
    primArr?: PrimArr
    nestArr?: NestArr
    numArm?: NumArm
    boolArm?: BoolArm
    withLiterals?: WithLiterals
    withTagRun?: WithTagRun
    onBorderRadius?: (v: BorderRadius) => void
    onPrimArr?: (v: PrimArr) => void
}) => JsxElement
