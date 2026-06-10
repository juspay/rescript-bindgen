// `Omit<ButtonHTMLAttributes, K>` -> a NARROWED variant: only the hierarchy slice
// containing the removed keys (here: htmlAttributes' globals, which hold style and
// className) is re-materialized; aria + events stay shared spreads. Two components
// with the SAME Omit set prove the variant is defined once (deduped by removed-set).
type JsxElement = { __brand: 'element' }
interface AriaAttributes { 'aria-label'?: string }
interface DOMAttributes<T> { onFocus?: (e: FocusEvent) => void }
interface HTMLAttributes<T> extends AriaAttributes, DOMAttributes<T> { className?: string; style?: string; id?: string }
interface ButtonHTMLAttributes<T> extends HTMLAttributes<T> { disabled?: boolean; type?: 'submit' | 'reset' | 'button' }

export declare const IconButton: (props: {
  icon?: string
} & Omit<ButtonHTMLAttributes<HTMLButtonElement>, 'style' | 'className'>) => JsxElement

export declare const GhostButton: (props: {
  ghost?: boolean
} & Omit<ButtonHTMLAttributes<HTMLButtonElement>, 'style' | 'className'>) => JsxElement
