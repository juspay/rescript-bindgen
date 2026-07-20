// A DIFFERENT symbol also named `Button` — used only by a smoke check to prove a genuine cross-entry
// name collision is REPORTED (skipped), not silently dropped. Not listed in package.json exports.
type JsxElement = { __brand: 'element' }
export declare const Button: (props: { variant: string }) => JsxElement
