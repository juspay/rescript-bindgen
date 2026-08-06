// #167: a NESTED discriminated-union TYPE — `Base & (A | B)` — distributes to a UNION of full
// intersections, whose arms all share the base's symbol, so the same-generic-record collapse fires
// and hands the UNION to the record builder. `getProperties()` on a union yields only the props
// common to EVERY arm, so every arm-specific field used to be silently dropped: `rowAnimationConfig`
// emitted just `enterDuration`/`enterOffset`/`transitionType`, letting a consumer construct
// `{transitionType: "bezier"}` with no curve — a runtime crash inside the library, reported as clean.
// The record now also carries each arm-specific field as OPTIONAL (required within its arm, but
// ReScript can't express the discriminated dependency) — the same flatten-optional model the
// component-PROPS path uses (see `discriminated-union-props`, #63 C2).
type JsxElement = { __brand: 'element' }

type RowAnimationBase = { enterDuration: number; enterOffset: number }
export type RowAnimationConfig = RowAnimationBase & (
    | { transitionType: 'bezier'; duration: number; bezier: [number, number, number, number] }
    | { transitionType: 'spring'; stiffness: number; damping: number; mass: number }
)

// The same shape one level DEEPER — reached as a FIELD of a record, not as a prop's own type.
type TableSettings = { rowAnimation?: RowAnimationConfig; sticky?: boolean }

// A 3-arm union where a field is shared by SOME arms but not all (`stagger` in text+number, absent
// in date): not common to every arm, so it too is arm-specific and lands optional.
type ColumnBase = { field: string }
type ColumnConfig = ColumnBase & (
    | { kind: 'text'; maxChars: number; stagger: number }
    | { kind: 'number'; precision: number; stagger: number }
    | { kind: 'date'; format: string }
)

// An arm-specific name declared by SEVERAL arms at DIFFERENT types (react-day-picker's `selected`:
// `Date` in the single arm, `Date[]` in the multi arm, absent when no mode is set) must NOT take arm
// 1's type — that would emit a confident, plainly-wrong type for the other arms. Such a field is
// typed as the UNION of its arm types and classified as such, so the normal union machinery decides
// honestly (an exact variant when the arms are discriminable — here `string` vs `array` — else a
// flagged placeholder). NB `selected` must be absent from at least one arm to be arm-specific at all:
// a name present in EVERY arm is common, and the checker merges its type itself.
type SelectBase = { autoFocus?: boolean }
// `onSelect` is the harder half: arms that are FUNCTIONS. TS resolves a call on a union of signatures
// by INTERSECTING their parameters, so unioning `(v: string) => void` with `(v: string[]) => void`
// would synthesise `string & string[]` — a confident-looking signature NO arm accepts. Such a field is
// therefore emitted as a bucketed `review` placeholder ("flag, don't fake"), not a fabricated callback.
type SelectionConfig = SelectBase & (
    | { mode: 'single'; selected?: string; onSelect?: (value: string) => void }
    | { mode: 'multi'; selected?: string[]; onSelect?: (value: string[]) => void }
    | { mode: 'none' }
)

// NB: this record collapse is the mapping for a union in RECORD-FIELD / PROP position. The same
// union as an ARRAY ELEMENT (`ColumnConfig[]`) takes the opaque-views path instead (`from*`/`as*`
// per arm — see `unboxed-unions` / `ref-union-views`), which keeps each arm's own requiredness and
// is unaffected by this fixture.
export declare const DataTable: (props: {
    animation?: RowAnimationConfig
    settings?: TableSettings
    column?: ColumnConfig
    selection?: SelectionConfig
    label?: string
}) => JsxElement
