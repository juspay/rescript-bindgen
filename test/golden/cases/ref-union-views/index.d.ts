// base-ui's remaining review patterns (#39) + the flag-don't-fake gate from its review:
//   1. boolean | RefObject<…> | (CLEAN fn)  -> @unboxed Bool | Ref | Fn — runtime-
//      discriminable; the Ref arm renders the standard ref type.
//   2. boolean | RefObject<…> | (fn whose return mixes runtime shapes) -> the return
//      becomes a construct-only views module (#39): `FinalFocusTarget.fromBool /
//      fromHTMLElement / none` (none = the void|null arm; unit IS undefined at runtime).
//      Consumer-PRODUCED position, so construct-only is complete coverage — the Fn arm
//      passes #40's return gate with an EXACT type instead of being dropped.
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
