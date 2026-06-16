// Nullability / optionality must survive — strictNullChecks is off, so `| null` / `| undefined`
// vanish from the resolved type and are recovered from the SYNTACTIC node (#63 C5):
//   - `T | null` (required) -> `Nullable.t<T>` for ANY single T (array/record/primitive), NOT a
//     required non-nullable type (dropping `| null` flipped required-ness).
//   - `T | undefined` (required decl) -> an OPTIONAL field (`=?`); it can be omitted.
//   - `Props["x"]` indexed access into an OPTIONAL source prop -> optional too (the `| undefined`
//     is stripped from both syntactic and resolved types under strictNullChecks-off).
// Applies to BOTH record fields and component props.
type JsxElement = { __brand: 'element' }

interface Row {
  id: string
}

interface PanelData {
  data: Row[] | null // -> Nullable.t<array<row>>
  activeKeys: string[] | null // -> Nullable.t<array<string>>
  note: string | undefined // required decl, `| undefined` -> optional `note?`
  subtitle?: string // optional source for the indexed-access test below
}

export declare const Panel: (props: {
  rows: Row[] | null // component prop -> ~rows: Nullable.t<array<row>>
  data: PanelData
  caption: PanelData['subtitle'] // indexed access into optional -> ~caption: …=?
}) => JsxElement
