// A prop declared in BOTH an inherited shape (OPTIONAL, with a `| undefined`-bearing type) and
// the OWN object (REQUIRED) is a merged intersection property with multiple declarations. Its
// required-ness comes from the symbol, NOT from a `| undefined` in one declaration's type node:
// `p.declarations[0]` may be the inherited optional one, whose syntactic `| undefined` used to
// wrongly flip the required own prop to optional (regressed blend's `TimelineHeader.title` /
// `TabsV2Trigger.children`). The syntactic null/undefined recovery is now trusted only for a
// SINGLE-declaration (own) prop. (#63 review)
type JsxElement = { __brand: 'element' }

interface Base {
  label?: string | undefined // inherited + optional
  caption: string | undefined // inherited + REQUIRED-with-undefined (single-decl recovery still applies)
}

export declare const Widget: (props: Base & {
  label: string // own + REQUIRED -> stays required (merged, not flipped optional)
}) => JsxElement
