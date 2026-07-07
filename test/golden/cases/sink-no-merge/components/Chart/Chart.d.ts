type JsxElement = { __brand: 'element' }
interface ChartPoint { x: number; y: number }
export declare const Chart: (props: {
  data?: (string | number) | (string | number)[] | ChartPoint
  size?: string | number
}) => JsxElement
