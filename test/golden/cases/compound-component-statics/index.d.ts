// Compound-component statics (#100) — the dominant pre-Radix idiom (antd's Menu.Item /
// Select.Option, react-bootstrap, headlessui's Dialog.Panel): a component VALUE carries other
// components as properties. Previously only the parent bound; every static vanished with no
// skip entry. Now each component-typed static becomes a sibling module bound THROUGH the parent
// (`@scope("Menu") … = "Item"` — runtime-correct, the static lives ON the parent object), plus a
// zero-cost `module Item = MenuItem` alias in the parent file enabling `<Menu.Item />`.
type JsxElement = { __brand: 'element' }
type FC<P> = (props: P) => JsxElement

// the issue's repro: two component statics + a non-component static (reported, not silent)
export declare const Menu: FC<{ open?: boolean }> & {
  Item: FC<{ label: string }>
  Divider: FC<{ inset?: boolean }>
  VERSION: string
}

// a static that is ALSO exported flat (antd exports both `Select` and `SelectOption`):
// dedupes by type identity — the alias reuses the flat module, no duplicate sibling.
export declare const SelectOption: FC<{ value: string }>
export declare const Select: FC<{ multi?: boolean }> & { Option: typeof SelectOption }

// NESTED compound (antd's Table.Summary.Row): the inner static binds with a scope PATH,
// `@scope(("Table", "Summary"))`, and each level aliases its children.
export declare const Table: FC<{ bordered?: boolean }> & {
  Summary: FC<{ fixed?: boolean }> & { Row: FC<{ height: number }> }
}
