// A nested DATA record that INHERITS HTML attributes (here via a lib.dom base — `isInherited`
// keys on the declaration file, so we extend a real lib.dom type rather than an inline stub)
// AND has first-party fields whose names collide with DOM attributes (`id`, `size`).
//
// `...JsxDOM.domProps` is all-or-nothing (unlike the component path's narrowable HtmlAttrs
// variants) and ReScript rejects an explicit field overlapping a spread — so colliding
// first-party fields used to be SILENTLY DROPPED (blend's `AvatarData` lost required `id`,
// `size`, `shape`). The named first-party fields matter more than the generic inherited-attr
// bag, so on collision we keep ALL own fields with their real types and drop the spread. (#63 C3)
type JsxElement = { __brand: 'element' }

interface ItemData extends EventTarget {
  id: string | number // first-party + required; name collides with DOM `id` -> KEPT (real type)
  size?: 'sm' | 'lg' // name collides with DOM `size` -> KEPT
  label: string // no collision
}

export declare const List: (props: { items: ItemData[] }) => JsxElement
