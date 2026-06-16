// `key` (and `ref`) are React-reserved ONLY on a component's top-level props. Inside a nested
// DATA record `key` is real payload and must survive — dropping it made records like Highcharts'
// `colors: { key: string; color: string }[]` (key→series maps) unusable. (#63 C1)
//   - Component top-level `key`/`ref`  -> dropped (React-reserved), as before.
//   - Nested data record `{ key; color }` -> `key` KEPT.
type JsxElement = { __brand: 'element' }

export declare const Chart: (props: {
  key?: string // top-level React-reserved -> dropped
  ref?: string // top-level React-reserved -> dropped
  series?: { key: string; color: string }[] // nested data -> `key` kept
}) => JsxElement
