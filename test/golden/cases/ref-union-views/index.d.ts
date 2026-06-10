// base-ui's remaining review patterns (#39), three mappings in one case:
//   1. boolean | RefObject<…> | (fn)  -> @unboxed Bool | Ref | Fn (runtime-discriminable;
//      the Ref arm renders the standard ref type)
//   2. HTMLElement | ShadowRoot | RefObject<…> -> opaque module with from* views
//      (ShadowRoot -> Dom.shadowRoot unblocks the existing opaqueUnion machinery)
//   3. LocalesArgument -> string + ⓘ note (BCP-47 tag covers the 99% case)
type JsxElement = { __brand: 'element' }
interface RefObject<T> { current: T | null }
type LocalesArgument = string | readonly string[]

export declare const Focusable: (props: {
  finalFocus?: boolean | RefObject<HTMLElement> | ((closeType: string) => boolean | void | HTMLElement)
  container?: HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>
  locale?: LocalesArgument
}) => JsxElement
