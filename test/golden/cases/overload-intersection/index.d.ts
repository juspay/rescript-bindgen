// Intersection of two CALL signatures = an overloaded function (a TS overload).
// ReScript has no overloaded-function type, so this can't be modelled exactly — per the
// "flag, don't fake" rule it should be FLAGGED (🔍 review). At minimum the OPTIONAL param
// `reason?` must map to `option<...>` (not a required arg), and the dropped `(e: MouseEvent)`
// overload should be surfaced, not silently swallowed.
//
// This is `react-toastify`'s real `CloseToastFunc`. TARGET output: see TARGET.md.
type JsxElement = { __brand: 'element' }
type CloseToastFunc = ((reason?: boolean | string) => void) & ((e: MouseEvent) => void)

export declare const CloseButton: (props: {
  closeToast: CloseToastFunc
}) => JsxElement
