// Error-`any` from an UNRESOLVABLE import (#107) — blend's exact bug shape: `ThemeType` is
// imported from './tokens', but that module doesn't export it (upstream a new tokens.d.ts
// shadows the tokens/ directory). The checker yields its ERROR type, which masquerades as
// `any`; previously the #31 implicit-generic salvage turned it into a SILENT `'a`
// (ThemeProvider's `~foundationTokens: 'a=?`, defects=0 — the theming entry point, unusable
// and unreported). Now it emits a 🛑-flagged placeholder naming the broken-import cause, and
// the report's declaration column shows the reference (`ThemeType`) to hand-match.
// AUTHOR-WRITTEN `any` is untouched: `legitAny` keeps the implicit type variable.
import { ThemeType } from './tokens'
type JsxElement = { __brand: 'element' }

export declare const ThemeProvider: (props: { foundationTokens?: ThemeType; name?: string }) => JsxElement
export declare const getTabsTokens: (theme: ThemeType) => string
export declare const legitAny: (x: any) => string
