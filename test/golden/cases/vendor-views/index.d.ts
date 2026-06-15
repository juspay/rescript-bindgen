// #39 — exact views for the formerly-review union patterns. Four mechanisms:
//   1. VENDOR-record trial: dependency-declared, consumer-CONSTRUCTED shapes (Rect,
//      VirtualElement) extract as exact records IFF every field is perfect (sandboxed,
//      rolled back otherwise — `Tainted` proves the rejection path: its prop stays review).
//   2. literal arms in views modules: 'clipping-ancestors' -> a ready-made constant via a
//      single-value polyvar cast (no open string leak).
//   3. consumer-PRODUCED return unions -> construct-only `<Prop>Target` views module:
//      fromBool / fromHTMLElement / none (none = the null|void arm; unit IS undefined).
//      Works at the prop level (finalFocus) and nested (anchor's fn arm, VirtualElement's
//      getClientRects). DOMRectList passes through as a WebTypes sink type.
//   4. deep member check: a views-module member carrying ANY inner imperfection rejects
//      the whole module (no unflagged `=> string` fakes inside).
import { Boundary, VirtualElement, Tainted } from '@floating-ui/stub'
type JsxElement = { __brand: 'element' }
interface RefObject<T> { current: T | null }
type InteractionType = 'mouse' | 'touch' | 'keyboard'

export declare const Positioner: (props: {
  collisionBoundary?: Boundary
  anchor?: Element | null | VirtualElement | RefObject<Element | null> | (() => Element | VirtualElement | null)
  finalFocus?: boolean | RefObject<HTMLElement> | ((closeType: InteractionType) => boolean | HTMLElement | null | void)
  tainted?: Tainted
}) => JsxElement
