// Prop-position `any` -> an implicit component generic (#31, probe I-2) — the same
// treatment an EXPLICIT generic already gets (SliderRoot<Value> -> 'a):
//   - `WidgetValue = (any | null)[]` props UNIFY on one variable keyed by the alias:
//     value/defaultValue/onValueChange all use 'a -> controlled usage works.
//   - a BARE `any` gets a fresh variable per occurrence ('b, 'c).
// Inside SHARED record fields `any` stays a flagged defect (a shared type can't be
// component-generic) — `meta.payload` keeps the 🛑 path.
type JsxElement = { __brand: 'element' }
type WidgetValue = (any | null)[]
interface WidgetMeta { label: string; payload: any }

export declare const Widget: (props: {
  value?: WidgetValue
  defaultValue?: WidgetValue
  onValueChange?: (value: WidgetValue) => void
  tag?: any
  other?: any
  meta?: WidgetMeta
}) => JsxElement
