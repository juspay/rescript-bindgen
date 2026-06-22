// Standalone (non-React) function exports — the generic-TS path (M1). Each exported
// function / const-with-call-signature becomes a positional `@module external`:
//   - add        plain numeric args + numeric return
//   - greet      string arg + string return
//   - now        ZERO args            -> `unit => …` (an external can't take no args)
//   - forEach    a callback param + a `void` return -> `… => unit`
//   - translate  a NAMED record param AND return -> lands in the shared `*Types.res`,
//                referenced qualified (proves functions reuse the component pipeline)
//   - renderThing a MULTI-ARG fn returning JSX.Element -> stays a FUNCTION, not a fake
//                `@react.component` that would silently drop every arg past the first (#63 C4).
//   - getSlots    a 1-arg fn whose RETURN is a 1-TUPLE `[ReactNode?]` -> `array<React.element>`
//                (ReScript has no 1-tuples; the 0-or-1 sequence is faithfully an array, #83).
//   - makeClick   RETURN is a React synthetic event `React.MouseEvent<…>` -> `ReactEvent.Mouse.t`
//                (event types are recognized in any position, not only `on*` handlers, #83).
//   - useThing    RETURN is a union of two SAME-KEYED anonymous objects -> ONE merged record
//                (`{ok,value}` over both arms), not a flagged `string` (#83).
type ReactNode = { __brand: 'node' }
declare namespace JSX {
  interface Element {
    __brand: 'element'
  }
}
interface Point {
  x: number
  y: number
}

export declare function add(a: number, b: number): number
export declare function greet(name: string): string
export declare function now(): number
export declare function forEach(items: number[], fn: (value: number, index: number) => void): void
export declare const translate: (p: Point, dx: number, dy: number) => Point
export declare const renderThing: (a: Point, b: Point) => JSX.Element
export declare const getSlots: (item: Point) => [ReactNode?]
export declare function makeClick(href: string): import('react').MouseEvent<HTMLAnchorElement>
export declare function useThing(on: boolean): { ok: boolean; value: string } | { ok: boolean; value: number }
