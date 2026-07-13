// Prop-position `any` -> an implicit component generic (#31, probe I-2) — the same
// treatment an EXPLICIT generic already gets (SliderRoot<Value> -> 'a):
//   - `WidgetValue = (any | null)[]` props UNIFY on one variable keyed by the alias:
//     value/defaultValue/onValueChange all use 'a -> controlled usage works.
//   - a BARE `any` gets a fresh variable per occurrence ('b, 'c).
// Inside SHARED record fields `any` stays a flagged defect (a shared type can't be
// component-generic) — `meta.payload` keeps the 🛑 inline flag, and since #133 the deep
// report walk surfaces it on Widget itself: the `meta` prop binds fine, but because it
// reaches a flagged shared field, Widget is pulled into 🔍 REVIEW (nested defects elevate to
// review AT MOST, never 🛑 broken) with a row naming `widgetMeta.payload` — instead of the
// component reading ✅ usable while shipping the flagged field.
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
