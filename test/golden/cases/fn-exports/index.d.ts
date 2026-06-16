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
//   - getSlots    a 1-arg fn whose RETURN is a TUPLE `[ReactNode?]` -> a FUNCTION: a React
//                element must BE the return, not merely appear inside a tuple/array (#63 C4).
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
