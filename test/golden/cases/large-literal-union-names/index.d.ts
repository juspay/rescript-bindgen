// A named large literal union follows the upstream alias instead of spelling every member in its
// public ReScript name. The prior structural name remains a compatibility alias (#190).
type JsxElement = { __brand: 'element' }

export type StatusCode = 100 | 101 | 200 | 201 | 400 | 500
export type ContentfulStatusCode = 100 | 101 | 200 | 201 | 400

export declare const ResponseView: (props: {
  status: StatusCode
  contentStatus?: ContentfulStatusCode
}) => JsxElement
