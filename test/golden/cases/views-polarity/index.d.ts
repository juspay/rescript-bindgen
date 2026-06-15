// #39 review hardening — the four contract-edge cases for opaque views modules. Every one
// of these silently mis-generated before the review fixes; this case locks them.
type JsxElement = { __brand: 'element' }
interface VirtualBox { x: number }
interface PlainSpot { y: number }

export declare const Widget: (props: {
  // 1. RESERVED-WORD literal arms -> valid idents (`true_`/`lazy_`), and the prop's ⓘ note
  //    must name the SAME idents (shared RESCRIPT_RESERVED set across extract + emit).
  mode?: 'true' | 'lazy' | VirtualBox | PlainSpot
  // 2. IDENT-COLLIDING literals (`'trap-focus'` & `'trapFocus'` both camel to `trapFocus`):
  //    all-cases-or-flag -> the WHOLE prop stays ⚠️ REVIEW (never silently drop a variant).
  collide?: 'trap-focus' | 'trapFocus' | VirtualBox | PlainSpot
  // 3. RECEIVE position (a callback PARAM the library produces): construct-only views would
  //    be an uninspectable black box -> honest #41 type-variable salvage instead (`'a => unit`).
  onState?: (state: 'open' | VirtualBox | PlainSpot) => void
  // 4. consumer-PRODUCED return -> a real construct-only views module is correct here.
  resolve?: () => boolean | VirtualBox | PlainSpot | null
}) => JsxElement
