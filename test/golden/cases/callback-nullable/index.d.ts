// `T | null` on a CALLBACK boundary keeps the null (strictNullChecks-off strips it from the
// resolved type; recovered from the syntactic node, like top-level props). (#63 validation)
//   - a PARAM `(item: string | null) => void` -> `Nullable.t<string> => unit`: the library
//     PASSES item to the consumer, who must handle null.
//   - a single-typed nullable RETURN `(row) => Row | null` -> `row => Nullable.t<row>`: it
//     collapses to `Row` (not a union), so it's wrapped here rather than via the union path.
type JsxElement = { __brand: 'element' }

interface Row {
  id: string
}

export declare const Widget: (props: {
  onActiveChange?: (item: string | null) => void
  validate?: (row: Row) => Row | null
}) => JsxElement
