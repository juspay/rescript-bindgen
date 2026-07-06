// #84 — a styled-components export (`IStyledComponentBase<…> & string`) exposes TWO call
// signatures: FIRST the polymorphic `as`-rebinding form (`<AsTarget, ForwardedAsTarget>(…)`),
// whose visible props are only the styling plumbing — theme/as/forwardedAs/style — as giant
// unresolved conditionals; THEN the concrete zero-typeparam forwardRef form carrying the
// component's real props. Reading sigs[0] bound the plumbing and dropped every functional prop
// (`children` included) — blend's 8 Styled* exports emitted 4 loose strings each and nothing else.
//
//   StyledTabs — MUST bind sig 1's real surface (value/onValueChange/orientation/children +
//                the ExecutionProps plumbing), not sig 0's `as`-conditional ghost.
//   Generic    — a SINGLE-signature generic component keeps its type variable ('a) untouched
//                by the preference rule (it only fires when several signatures exist).
type JsxElement = { __brand: 'element' }

type KnownTarget = string
interface ExecutionProps {
  as?: KnownTarget
  forwardedAs?: KnownTarget
}

// sig 0: polymorphic `as` form (the ghost) — sig 1: concrete forwardRef form (the real props)
interface PolymorphicComponent<P extends object> {
  <AsTarget extends KnownTarget | void = void>(props: P & ExecutionProps & { as?: AsTarget }): JsxElement
  (props: P & ExecutionProps): JsxElement
}

interface TabsProps {
  value?: string
  onValueChange?: (value: string) => void
  orientation?: 'horizontal' | 'vertical'
  children?: JsxElement
}

export declare const StyledTabs: PolymorphicComponent<TabsProps> & string

// control: single-signature generic component — untouched by the preference rule
export declare const Generic: <T>(props: { items: T[]; render: (item: T) => JsxElement }) => JsxElement
