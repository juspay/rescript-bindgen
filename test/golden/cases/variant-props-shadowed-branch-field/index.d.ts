// Two @tag branches share the field NAME `data` but with DIFFERENT shared-record types. The merged
// `props` list keeps only the first branch's type (`foo`), so `bar` — used only by the second branch's
// same-named field — is invisible to the reachability sweep's `props` roots and would be swept, leaving
// the emitted `@tag` variant referencing an undeclared `bar`. The sweep must root every branch field. (#178)
type JsxElement = { __brand: "element" }
export interface Foo { a: string; b: number }
export interface Bar { c: boolean; d: string }
export type WidgetProps =
  | { kind: "first"; data: Foo }
  | { kind: "second"; data: Bar };
export declare const Widget: (props: WidgetProps) => JsxElement;
