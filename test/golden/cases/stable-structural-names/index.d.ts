// #90 — anonymous `{…}` records are named by a STABLE ANCHOR, never a registration-order
// counter (`…Config2`/`…Config3`) that renumbered a byte-identical shape when an unrelated
// sibling was added/removed upstream. Three anchors, all known at registration time (so no
// post-build rename — self/mutual references stay intact):
//
//   ① PROPERTY PATH — the field chain that reaches the shape. `circle.completed`,
//      `icon.completed`, `text.completed` are THREE distinct shapes via the same leaf field
//      `completed`; path-anchoring makes them `…CircleCompletedConfig` / `…IconCompletedConfig`
//      / `…TextCompletedConfig` (stable regardless of the others), not `…Config`/`2`/`3`.
//
//   ② OWNING NAMED TYPE — a named type seeds its descendants with its OWN name, so the same
//      inline field name declared in two DIFFERENT named types (here `cell` in `TextColumn`
//      and in `DateColumn`, different shapes) stays apart: `textColumnCellConfig` vs
//      `dateColumnCellConfig`, not `cellConfig` + counter.
//
//   ③ DISCRIMINANT TAG — each arm of a discriminated union is named by its tag, not arm order.
//      `items` is `{ kind: 'text'; … } | { kind: 'icon'; … }` → `…ItemsTextConfig` /
//      `…ItemsIconConfig`, not `…ItemsConfig`/`2`.
type JsxElement = { __brand: 'element' }

interface TextColumn {
  cell: { value: string }
}
interface DateColumn {
  cell: { value: string; format: string }   // SAME field `cell`, DIFFERENT shape, different owner
}

export declare const Stepper: (props: {
  // ① deeply-nested token tree: many anon `{…}` reached via recurring leaf names at
  //    different shapes.
  tokens: {
    circle: { completed: { outline: string }; default: { outline: string } }
    icon: { completed: { color: string }; default: { color: string } }
    text: { completed: { color: string; weight: string }; default: { color: string; weight: string } }
  }
  // ② two named types each carry an inline `cell: {…}` of a different shape.
  textColumn: TextColumn
  dateColumn: DateColumn
  // ③ discriminated union — arms tagged by `kind`, named by the tag not by order.
  items: ({ kind: 'text'; label: string } | { kind: 'icon'; glyph: string })[]
}) => JsxElement
