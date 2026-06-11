// #41 — the three-rung "most specific type wins" ladder for previously-fake fn params:
//   1. `{}` empty state (base-ui's ComboboxEmptyState idiom) -> JSON.t (the `unknown`
//      precedent): Fn(JSON.t => string) instead of the unflagged Fn(string => string).
//   2. FormData with webapi OFF -> OUR abstract WebTypes sink type:
//      Fn(WebTypes.formData => 'a) instead of the unflagged Fn(string => 'a).
//      (With rescript-webapi installed it stays the FULL Webapi.FormData.t.)
//   3. A genuinely-unnameable param (review-classified) -> a fresh type variable —
//      the type system's own "you receive something unnameable" signal.
type JsxElement = { __brand: 'element' }
interface EmptyState {}
type Weird = symbol | bigint // classifies review -> exercises rung 3

export declare const Widget: (props: {
  className?: string | ((state: EmptyState) => string)
  formAction?: string | ((formData: FormData) => void | Promise<void>)
  weirdCb?: string | ((w: Weird) => string)
}) => JsxElement
