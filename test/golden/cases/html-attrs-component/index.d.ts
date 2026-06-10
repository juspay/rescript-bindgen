// A component extending an HTML attribute interface -> record-props form:
//   type props = { ...HtmlAttrs.buttonHTMLAttributes, <own fields> }
//   external make: React.component<props>
// Detection is NAME-based (interface name ∈ the vendored attribute groups), so these
// inline stubs behave exactly like the real @types/react. NOTE: the stub FIELDS are
// irrelevant to the output — the emitted HtmlAttrs.res spread comes from the vendored
// @types/react data (src/html-attrs-data.mjs), and every flattened prop declared in an
// attribute interface is dropped in favour of the spread.
type JsxElement = { __brand: 'element' }
interface AriaAttributes { 'aria-label'?: string }
interface DOMAttributes<T> { onFocus?: (e: FocusEvent) => void }
interface HTMLAttributes<T> extends AriaAttributes, DOMAttributes<T> { className?: string; style?: string; id?: string }
interface ButtonHTMLAttributes<T> extends HTMLAttributes<T> { disabled?: boolean; type?: 'submit' | 'reset' | 'button' }

export declare const FancyButton: (props: {
  text?: string
  loading?: boolean
} & ButtonHTMLAttributes<HTMLButtonElement>) => JsxElement
