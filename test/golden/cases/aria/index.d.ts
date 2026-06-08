// ARIA / role attributes map to their exact JsxDOM types (verbatim), bypassing
// the generic union logic: tri-state -> poly variant, boolean -> bool,
// numeric -> int, label/role -> string.
type JsxElement = { __brand: 'element' }

export declare const Aria: (props: {
  'aria-checked'?: boolean | 'false' | 'mixed' | 'true' // -> [#"true" | #"false" | #mixed]
  'aria-disabled'?: boolean                              // -> bool
  'aria-level'?: number                                  // -> int
  role?: string                                          // -> string
}) => JsxElement
