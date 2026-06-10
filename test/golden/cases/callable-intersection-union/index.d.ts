// base-ui's state-dependent prop pattern (#22), in both shapes the checker produces:
//   className: string | ((state: S) => string | undefined)            -- plain fn arm
//   style:     CSSProperties | (CSSProperties & ((state: S) => CSSProperties))
//                                                                     -- INTERSECTION arm
// Both -> zero-cost `@unboxed` untagged variants (object/string vs function are
// distinct runtime tags):
//   @unboxed type alphaStateStyle = Style(JsxDOM.style) | Fn(alphaState => JsxDOM.style)
// TWO components with DIFFERENT state records but the SAME prop names lock the
// structural dedup key: each must get its own type (alphaStateStyle / betaStateStyle),
// never silently deduped to the first one's state.
type JsxElement = { __brand: 'element' }
interface CSSProperties { color?: string; opacity?: number }
interface AlphaState { open: boolean }
interface BetaState { checked: boolean }

export declare const Alpha: (props: {
  className?: string | ((state: AlphaState) => string | undefined)
  style?: CSSProperties | (CSSProperties & ((state: AlphaState) => CSSProperties))
}) => JsxElement

export declare const Beta: (props: {
  className?: string | ((state: BetaState) => string | undefined)
  style?: CSSProperties | (CSSProperties & ((state: BetaState) => CSSProperties))
}) => JsxElement
