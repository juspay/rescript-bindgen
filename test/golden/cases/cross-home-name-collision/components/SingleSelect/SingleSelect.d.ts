type JsxElement = { __brand: 'element' }
export interface SelectMenuGroup { label: string; count: number; nested: boolean }
export declare const SingleSelect: (props: { group?: SelectMenuGroup }) => JsxElement
