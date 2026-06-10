// All-DOM-event unions (#30, probe I-1b/I-6): base-ui's `ReasonToEvent<Reason>`
// conditionals distribute into unions of DOM event types. All members are
// `typeof "object"`, so @unboxed can't discriminate — and one such FIELD used to
// poison its whole record/callback into a string placeholder. The union collapses
// to the safe supertype `Dom.event`, letting the record extract cleanly:
//   onValueChange: (float, fieldChangeDetails) => unit
//   with fieldChangeDetails = { reason, event: Dom.event, cancel: unit => unit, isCanceled: bool }
type JsxElement = { __brand: 'element' }

interface FieldChangeDetails {
  reason: string;
  event: InputEvent | FocusEvent | KeyboardEvent | PointerEvent | Event;
  cancel(): void;
  isCanceled: boolean;
}

export declare const NumberField: (props: {
  onValueChange?: (value: number, eventDetails: FieldChangeDetails) => void
}) => JsxElement
