import type { EventsObj } from '../shared'
type JsxElement = { __brand: 'element' }
interface Series { events?: EventsObj; name?: string }
interface L6 { series?: Series; s6?: string }
interface L5 { l6?: L6 } interface L4 { l5?: L5 } interface L3 { l4?: L4 }
interface L2 { l3?: L3 } interface L1 { l2?: L2 }
export declare const Deep: (props: { root?: L1 }) => JsxElement
