// base-ui's remaining review patterns (#39) + the flag-don't-fake gate from its review:
//   1. boolean | RefObject<…> | (CLEAN fn)  -> @unboxed Bool | Ref | Fn — runtime-
//      discriminable; the Ref arm renders the standard ref type.
//   2. boolean | RefObject<…> | (fn with an UNMODELLABLE return) -> stays an honest
//      ⚠️ REVIEW flag: a fake `=> string` inside a shared @unboxed would render
//      UNFLAGGED, so the Fn arm is imperfection-gated (memberOf returns null).
//   3. HTMLElement | ShadowRoot | RefObject<…> -> opaque module with from* views
//      (lib.dom ShadowRoot -> Dom.shadowRoot; a FIRST-PARTY type named ShadowRoot or
//      LocalesArgument is NOT hijacked — lib-declaration guarded).
type JsxElement = { __brand: 'element' }
interface RefObject<T> { current: T | null }
type LocalesArgument = string | readonly string[] // first-party impostor — must NOT get the Intl note

export declare const Focusable: (props: {
  toggleFocus?: boolean | RefObject<HTMLElement> | ((opened: boolean) => boolean)
  finalFocus?: boolean | RefObject<HTMLElement> | ((closeType: string) => boolean | void | HTMLElement)
  container?: HTMLElement | ShadowRoot | RefObject<HTMLElement | ShadowRoot>
  locale?: LocalesArgument
}) => JsxElement
