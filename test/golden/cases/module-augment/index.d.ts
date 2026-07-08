// #115 item 3 — TypeScript "module augmentation": a separate file adds fields to an interface via
// `declare module "…" { interface X { … } }`. These augmenting files are opt-in side-effect imports
// the entry `.d.ts` never imports (e.g. Highcharts' `modules/xrange` adds `Point.x2`), so they're
// not in the import graph and the generator never sees them — `point` had zero `x2`.
//
// `--augment ./augment` adds the augmenting file as a program root; TS then MERGES its additions
// onto the base interface, so `Point` gains `x2` / `custom`. Without the flag (see the default run),
// `Point` has only `x`.
type JsxElement = { __brand: 'element' }

export interface Point {
  x?: number
  name?: string
}

export declare const Chart: (props: { point?: Point }) => JsxElement
