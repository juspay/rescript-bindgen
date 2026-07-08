type JsxElement = { __brand: 'element' }
export interface SelectMenuGroup { items: string[]; open: boolean }
export declare const Select: (props: { group?: SelectMenuGroup }) => JsxElement
