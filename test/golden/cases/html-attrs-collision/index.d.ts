// An OWN prop whose name collides with a field of the attribute chain (`onClick`
// exists in the vendored domAttributes): the own prop WINS with its own (more
// specific) type, and the base is narrowed so the spread can never produce a
// duplicate-field compile error.
type JsxElement = { __brand: 'element' }
interface AriaAttributes { 'aria-label'?: string }
interface DOMAttributes<T> { onFocus?: (e: FocusEvent) => void }
interface HTMLAttributes<T> extends AriaAttributes, DOMAttributes<T> { className?: string; style?: string; id?: string }
interface ButtonHTMLAttributes<T> extends HTMLAttributes<T> { disabled?: boolean; type?: 'submit' | 'reset' | 'button' }

export declare const ClickyButton: (props: {
  onClick?: (value: string, index: number) => void
  label?: string
} & ButtonHTMLAttributes<HTMLButtonElement>) => JsxElement
