// #167: a NESTED discriminated-union TYPE — `Base & (A | B)` — distributes to a UNION of full
// intersections. `getProperties()` on a union yields only the props common to EVERY arm, so every
// arm-specific field used to be silently dropped: `rowAnimationConfig` emitted just
// `enterDuration`/`enterOffset`/`transitionType`, letting a consumer construct
// `{transitionType: "bezier"}` with no curve — a runtime crash inside the library, reported as clean.
//
// The mapping is now a `@tag` VARIANT — one inline-record branch per arm, so each branch keeps its OWN
// required fields (`Bezier` cannot be built without its curve). Runtime is a flat object carrying the
// real tag, so the library sees exactly what it expects. Every case below exercises that; the
// flatten-optional record (arm-specific fields optional) remains the FALLBACK for unions that can't
// carry a faithful variant — see `docs/TYPE_MAPPING.md` for the requirement table.
type JsxElement = { __brand: 'element' }

type RowAnimationBase = { enterDuration: number; enterOffset: number }
export type RowAnimationConfig = RowAnimationBase & (
    | { transitionType: 'bezier'; duration: number; bezier: [number, number, number, number] }
    | { transitionType: 'spring'; stiffness: number; damping: number; mass: number }
)

// The same shape one level DEEPER — reached as a FIELD of a record, not as a prop's own type.
type TableSettings = { rowAnimation?: RowAnimationConfig; sticky?: boolean }

// A 3-arm union where a field is shared by SOME arms but not all (`stagger` in text+number, absent in
// date). The variant keeps it REQUIRED in the two branches that declare it and absent from the third —
// the flattened fallback could only offer `stagger?`, valid to omit even for a text column.
type ColumnBase = { field: string }
type ColumnConfig = ColumnBase & (
    | { kind: 'text'; maxChars: number; stagger: number }
    | { kind: 'number'; precision: number; stagger: number }
    | { kind: 'date'; format: string }
)

// A name declared by SEVERAL arms at DIFFERENT types — react-day-picker's `selected` (`Date` single /
// `Date[]` multi / absent with no mode) and its per-mode `onSelect` handler. The variant types each
// branch EXACTLY (`selected?: string` in Single, `array<string>` in Multi; `onSelect` keeps its own
// signature per branch), which the flattened form cannot do: there it had to become an `@unboxed`
// string-or-array, and `onSelect` had to be FLAGGED, because TS resolves a call on a union of
// signatures by intersecting its parameters — fabricating a signature no arm accepts.
type SelectBase = { autoFocus?: boolean }
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
