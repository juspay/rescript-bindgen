// Generics. A genuinely generic component (`<T>`) maps its type parameter to a
// ReScript type variable. An "erased" generic — a forwardRef export that pins the
// parameter to `Record<string, unknown>` — is RE-genericized: the placeholder is
// recovered as `'a`, `unknown` -> JSON.t, `keyof T` -> string, and nested records
// carry the type variable too. (HTMLDivElement is lib.dom.)
//
// NOTE: recovery keys on the props being a generic TYPE ALIAS (`type Props<T> = …`),
// which is how real libraries (e.g. blend's DataTableProps) ship it. A generic
// `interface` instantiation is not currently re-genericized — see docs/TYPE_MAPPING.md.
type JsxElement = { __brand: 'element' }
type ReactNode = JsxElement | string | number | null | undefined
type ComponentType<P> = (props: P) => JsxElement
type ForwardRefExoticComponent<P> = { (props: P): JsxElement; displayName?: string }
interface RefAttributes<T> { ref?: T | null }

interface RowFilterProps {
  filters: unknown[]
  onChange: (f: unknown[]) => void
}

// Genuine generic component: T -> 'a
export declare const VirtualList: <T>(props: {
  items: T[]                                       // -> array<'a>
  renderItem: (item: T, index: number) => ReactNode // -> ('a, int) => React.element
}) => JsxElement

// Erased generic: TableProps<T> exported with T = Record<string, unknown>.
type TableProps<T> = {
  data: T[]                                   // -> array<'a>
  idField: keyof T                            // -> string (loose)
  onRowClick?: (row: T, index: number) => void        // -> ('a, int) => unit
  onSave?: (rowId: unknown, row: T) => void           // -> (JSON.t, 'a) => unit
  filterComponent?: ComponentType<RowFilterProps>     // -> React.component<rowFilterProps>
}
export declare const DataTable: ForwardRefExoticComponent<
  TableProps<Record<string, unknown>> & RefAttributes<HTMLDivElement>
>
