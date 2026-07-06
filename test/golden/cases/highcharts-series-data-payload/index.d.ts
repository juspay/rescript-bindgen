// Highcharts-style series data payloads.
//
// In the real `highcharts` package, concrete series options such as
// `SeriesXrangeOptions` expose `data?: Array<XrangePointOptionsObject>`, and
// the point objects are explicitly extensible through `custom?: Dictionary<any>`
// plus interface augmentation. The ReScript binding should let consumers pass
// their own typed point records directly instead of rebuilding them as JSON.
type JsxElement = { __brand: 'element' }

export interface PointOptionsObject {
  x?: number
  y?: number
  custom?: Record<string, any>
}

export interface XrangePointOptionsObject extends PointOptionsObject {
  x2?: number
  name?: string
}

export interface SeriesOptions {
  type?: string
  name?: string
}

export interface SeriesLineOptions extends SeriesOptions {
  type: 'line'
  data?: Array<number | [number, number] | PointOptionsObject>
}

export interface SeriesXrangeOptions extends SeriesOptions {
  type: 'xrange'
  data?: Array<XrangePointOptionsObject>
  depth?: undefined
}

export type SeriesOptionsType = SeriesLineOptions | SeriesXrangeOptions

export interface Options {
  series?: Array<SeriesOptionsType>
}

export declare const Chart: (props: {
  containerProps?: Record<string, any>
  options?: Options
}) => JsxElement
