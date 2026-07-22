// #155: EVERY component with props binds as a nameable `type props = {…}` + `external make:
// React.component<props>` — the DEFAULT (and only) output form; not just HTML-attrs/shared-base
// components. That nameable type is what lets a consumer write a thin wrapper (`type props =
// Lib.Item.props` + `<Item {...props}/>` with one field overridden). JSX call sites are unchanged
// (JSX v4 lowers to make/props either way). No flag — one output form only.
type JsxElement = { __brand: 'element' }

// A PLAIN props object — no HTMLAttributes extension, no shared base. Previously labeled-args only.
export declare const AccordionItem: (props: {
  value: string;                 // required stays required
  title: string;
  subtext?: string;              // optional -> `subtext?: string`
  type?: "line" | "filled";      // reserved word -> @as("type") type_
  weird?: string | { a: 1 } | { b: 2 };  // loose -> flagged placeholder (flags survive record mode)
}) => JsxElement

// A props-LESS component is skipped as `no-props` by extraction (pre-existing, flag-independent) —
// it never reaches emit, so the flag can't produce an invalid empty `type props = {}` record.
export declare const Divider: (props: {}) => JsxElement
