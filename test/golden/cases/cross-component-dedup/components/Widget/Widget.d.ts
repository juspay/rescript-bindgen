type JsxElement = { __brand: 'element' }

// Lowercases to `option` — a ReScript pervasive. Must be suffixed (`option2`), never emitted
// bare, or it would shadow the builtin within its module.
interface Option {
  value: string
  label: string
}

export declare const Widget: (props: {
  badge?: { width: string; height: string }
  icon?: { width: string; height: string } // SAME shape as `badge` -> dedups WITHIN Widget
  choice?: Option
}) => JsxElement
