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

// NB: ARRAY-ELEMENT position gets the same `@tag` variant when the gates pass (see `FlatRow[]`
// below); the opaque-views module (`from*`/`as*` per arm — see `unboxed-unions` / `ref-union-views`)
// is the FALLBACK there when they fail — e.g. no clean discriminant, or a generic/lossy branch field.
export declare const DataTable: (props: {
    animation?: RowAnimationConfig
    settings?: TableSettings
    column?: ColumnConfig
    selection?: SelectionConfig
    label?: string
}) => JsxElement

// ARRAY-ELEMENT position (#169). A multi-object element union goes straight to the opaque-views module
// (`from*`/`as*` per arm) without passing through the union classifier, so it needs its own hook. The
// views module does keep per-arm requiredness — but READING one is an unchecked `%identity` cast: the
// consumer must already know which arm they hold, and calling the wrong `as*` is undefined behaviour.
// A `@tag` variant is exhaustively matchable and compiler-verified — strictly stronger. Blend's
// `MenuV2FlatRow` is this exact shape (and its three per-arm records each carried a ⚪ loose
// discriminant field, which the tag makes unnecessary).
type FlatRow =
    | { type: 'label'; id: string; label: string }
    | { type: 'separator'; id: string }
    | { type: 'item'; id: string; itemIndex: number }

export declare const flattenRows: (groups: string[]) => FlatRow[]

// SELF-REFERENTIAL discriminated union (#170) — the ordinary tree/menu/AST shape. The variant
// builder registers its entry BEFORE building branches (the same in-progress note records carry),
// so the self-reference resolves to the entry instead of restarting the build unboundedly (the
// 1.4.0-beta.0 regression: stack overflow -> the whole component silently dropped from the output).
// Emits the faithful recursive variant: @tag("kind") type rec treeNode = … | Branch({children:
// array<treeNode>, …}).
export type TreeNode =
    | { kind: 'leaf'; value: string }
    | { kind: 'branch'; children: TreeNode[]; label: string }

export declare const Tree: (props: { root?: TreeNode; nodes?: TreeNode[] }) => JsxElement

// MUTUAL recursion between two unions (#170 review) — neither type refers to itself; each reaches the
// other through a branch payload. The cycle guard is keyed per TYPE, so it composes across the pair:
// whichever is entered first registers, the second resolves its back-reference against that
// in-progress entry, and emit's SCC pass fuses them into ONE `type rec … and …` group. Locked here
// because this is a TERMINATION-class shape — the class that produced #170 — and the rule this PR
// adds to the skill is that those get a fixture, not an argument.
type NodeA =
    | { kind: 'leafA'; value: string }
    | { kind: 'wrapB'; inner: NodeB[] }
type NodeB =
    | { kind: 'leafB'; count: number }
    | { kind: 'wrapA'; inner: NodeA[] }

export declare const Graph: (props: { a?: NodeA; b?: NodeB }) => JsxElement

// BAIL INSIDE A CYCLE (#170 review) — the nastiest ordering: the self-reference has already resolved
// against the in-progress entry when a LATER branch field forces the bail (`any` → 🛑 BROKEN, which an
// inline-record payload can't carry a flag for). The rollback must un-register the early entry so the
// union falls through with no dangling self-reference pointing at a retracted name. Here the fallback
// is the record collapse (the arms share a base), which re-resolves the cycle itself: `type rec
// poisoned` with `children: array<poisoned>` and the `any` field honestly flagged.
// NB it must be `any`, not `unknown`: `unknown` maps to the honest `JSON.t` and is NOT an
// imperfection, so it would not trigger the gate at all.
type PoisonBase = { id: string }
type Poisoned = PoisonBase & (
    | { kind: 'ok'; children: Poisoned[] }
    | { kind: 'bad'; children: Poisoned[]; payload: any }
)

export declare const Poison: (props: { root?: Poisoned }) => JsxElement
