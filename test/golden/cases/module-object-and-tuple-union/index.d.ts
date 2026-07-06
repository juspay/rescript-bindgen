// #98.3 — two loose-`string` fallbacks that made blend's chart bindings uncallable:
//
//   1. `typeof Module` (a module/namespace OBJECT in value position — highcharts-react's
//      `highcharts?: typeof Highcharts`). A `string` can never carry the module object, so the
//      consumer was forced into an %identity cast. Now: an abstract nominal type in the
//      InstanceTypes sink (`~engine: ModuleObjectAndTupleUnionTypes.chartEngineModule=?`) — the
//      value passes through untouched; the consumer holds it via their own import binding.
//   2. a union of FIXED tuples over ONE primitive (`updateArgs?: [boolean] | [boolean, boolean]
//      | [boolean, boolean, boolean]`). Every arm is a runtime array of `bool` differing only in
//      length — inexpressible in ReScript anyway — so `array<bool>` is the faithful shape.
//
//   Controls: `mixedArgs` (tuple union over MIXED primitives) must STAY the flagged fallback;
//   `pair` (a lone fixed tuple) must stay a real ReScript tuple, untouched by the union rule.
type JsxElement = { __brand: 'element' }

// a namespace with runtime values — its `typeof` is a module object, like `typeof Highcharts`
declare namespace ChartEngine {
  const version: string
  function init(el: string): void
}

export interface ChartHandle { redraw(): void }

export declare const Chart: (props: {
  engine?: typeof ChartEngine
  updateArgs?: [boolean] | [boolean, boolean] | [boolean, boolean, boolean]
  mixedArgs?: [string] | [string, number]
  pair?: [number, number]
}) => JsxElement
