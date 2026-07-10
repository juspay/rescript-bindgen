// Shared-base props records (#82) + transitive HtmlAttrs detection (#130) — blend's exact
// Block-primitive shape. Previously EVERY Block-extending component inlined the full ~95-field
// CSS surface AND the flattened DOM/aria attributes (~149 labeled args per component); the
// HtmlAttrs spread never fired because the attrs arrive through a package-local ALIAS
// (`BlockProps`) wrapped in `Omit<>`. Now:
//   - the attrs surface is found TRANSITIVELY -> `...HtmlAttrs.htmlAttributesOmitChildrenColor`
//     (omit keys composed across BOTH layers: outer 'children', inner 'color');
//   - each pure package-local NAMED intersection part becomes ONE shared record spread
//     (`...Types.styledBlockProps`, `...Types.baseSkeletonProps`) — TS dissolves nested
//     intersections, so `StyledBlockProps` is recovered from the alias declaration's SYNTAX;
//   - only genuinely own props stay inline.
type JsxElement = { __brand: 'element' }
interface AriaAttributes { 'aria-label'?: string; 'aria-hidden'?: boolean }
interface DOMAttributes<T> { children?: string; onFocus?: (e: FocusEvent) => void; onMouseDown?: (e: MouseEvent) => void }
interface HTMLAttributes<T> extends AriaAttributes, DOMAttributes<T> { className?: string; style?: string; id?: string; color?: string }

// blend's StyledBlockProps shape: pure CSS surface, recursive state styles
type StateStyles = { _hover?: StyledBlockProps; _focus?: StyledBlockProps }
type StyledBlockProps = StateStyles & {
  color?: string
  padding?: string | number
  margin?: string | number
  display?: string
  gap?: string | number
}
// blend's BlockProps: alias-of-intersection — attrs reachable only transitively, and Omit'd
export type BlockProps = StyledBlockProps & Omit<HTMLAttributes<HTMLElement>, 'color'> & { as?: string }

type BaseSkeletonProps = { variant?: 'pulse' | 'wave'; loading?: boolean }

// two consumers prove the records are defined ONCE and spread from the shared module
export declare const SkeletonAvatar: (props: BaseSkeletonProps & Omit<BlockProps, 'children'> & { size?: 'sm' | 'lg' }) => JsxElement
export declare const SkeletonCard: (props: BaseSkeletonProps & Omit<BlockProps, 'children'> & { padding2?: string }) => JsxElement

// SHADOWED base falls back to inline (never a duplicate-label compile error): `loading` is
// redeclared in the component's own props, so BaseSkeletonProps must NOT spread here —
// its fields inline while the untouched styledBlockProps still spreads.
export declare const SkeletonBadge: (props: BaseSkeletonProps & Omit<BlockProps, 'children'> & { loading?: boolean; pulse?: boolean }) => JsxElement

// a component whose props are ONE named alias (no intersection) keeps today's inline record —
// a spread-only `props` would add indirection with no dedup win.
type PlainProps = { title?: string; open?: boolean }
export declare const Plain: (props: PlainProps) => JsxElement
